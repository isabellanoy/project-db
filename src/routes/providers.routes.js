const express = require('express');
const pool = require('../config/db');
const { generateCrud } = require('../utils/crudGenerator');

const router = express.Router();

const ok = (res, data = null, message = 'OK', status = 200) =>
  res.status(status).json({ ok: true, data, message });

const fail = (res, message = 'Error', status = 400, data = null) =>
  res.status(status).json({ ok: false, data, message });

const isErrorMessage = (message) =>
  typeof message === 'string' && message.trim().toUpperCase().startsWith('ERROR');

const parseIntParam = (value) => {
  if (value === undefined || value === null || value === '') return null;
  const parsed = Number(value);
  return Number.isInteger(parsed) ? parsed : null;
};

const parseDateOrNull = (value) => {
  if (!value) return null;
  const date = new Date(value);
  return Number.isNaN(date.getTime()) ? null : date;
};

router.get('/', (_req, res) => {
  return ok(res, { message: 'Rutas de proveedores activas' });
});

// --- AEROLÍNEAS ---

router.get('/aerolineas', async (_req, res, next) => {
  try {
    const result = await pool.query('SELECT * FROM fn_buscar_aerolineas()');
    return ok(res, result.rows, 'Aerolíneas obtenidas');
  } catch (error) {
    return next(error);
  }
});

router.get('/aerolineas/:id', async (req, res, next) => {
  const aeroId = parseIntParam(req.params.id);
  if (aeroId === null) {
    return fail(res, 'El parámetro id debe ser un entero válido.');
  }

  try {
    const result = await pool.query('CALL sp_obtener_aerolinea_por_id($1::int, null, null, null, null, null)', [aeroId]);
    const rawData = result?.rows?.[0];

    if (!rawData) {
      return fail(res, 'Aerolínea no encontrada', 404);
    }

    // El SP devuelve: cod, nombre, fecha_afiliacion, fecha_constitucion, lugar_origen
    const mappedData = {
        p_cod: rawData.cod,
        p_nombre: rawData.nombre,
        p_fecha_afiliacion: rawData.fecha_afiliacion,
        a_fecha_constitucion: rawData.fecha_constitucion,
        lugar_l_cod: rawData.lugar_origen
    };

    return ok(res, mappedData, 'Aerolínea obtenida');
  } catch (error) {
    console.error('Error SP Aerolínea:', error); 
    return next(error);
  }
});

router.post('/aerolineas', async (req, res, next) => {
  const { nombre, fecha_constitucion: fechaConstitucion, lugar_cod: lugarCod } = req.body ?? {};

  if (!nombre || !fechaConstitucion || lugarCod === undefined) {
    return fail(res, 'nombre, fecha_constitucion y lugar_cod son obligatorios.');
  }

  const fechaConstitucionDate = parseDateOrNull(fechaConstitucion);
  const lugarCodInt = parseIntParam(lugarCod);

  try {
    const values = [nombre, fechaConstitucionDate, lugarCodInt];
    const result = await pool.query('CALL sp_crear_aerolinea($1, $2::date, $3::int, null)', values);
    
    return ok(res, null, 'Aerolínea creada exitosamente', 201);
  } catch (error) {
    return fail(res, error.message || 'Error al crear aerolínea');
  }
});

router.put('/aerolineas/:id', async (req, res, next) => {
  const aeroId = parseIntParam(req.params.id);
  const { nombre, fecha_constitucion: fechaConstitucion, lugar_cod: lugarCod } = req.body ?? {};

  const fechaConstDate = parseDateOrNull(fechaConstitucion);
  const lugarCodInt = lugarCod !== undefined ? parseIntParam(lugarCod) : null;

  try {
    await pool.query('CALL sp_actualizar_aerolinea(null, $1::int, $2, null, $3::date, $4::int)', [
      aeroId,
      nombre,
      fechaConstDate,
      lugarCodInt
    ]);

    return ok(res, null, 'Aerolínea actualizada');
  } catch (error) {
    return fail(res, error.message);
  }
});

router.delete('/aerolineas/:id', async (req, res, next) => {
  const aeroId = parseIntParam(req.params.id);
  try {
    const result = await pool.query('CALL sp_eliminar_aerolinea($1::int, null, null)', [aeroId]);
    const payload = result?.rows?.[0] ?? {};

    if (payload.p_eliminada === false) {
       return fail(res, payload.p_mensaje, 400);
    }

    return ok(res, null, payload.p_mensaje || 'Aerolínea eliminada');
  } catch (error) {
    return fail(res, error.message);
  }
});

// --- OTROS PROVEEDORES (CRUD GENÉRICO) ---
router.use('/hoteles', generateCrud('Hotel', 'p_cod'));
router.use('/cruceros', generateCrud('Crucero', 'p_cod'));
router.use('/transportes-terrestres', generateCrud('Transporte_Terrestre', 'p_cod'));
router.use('/operadores-turisticos', generateCrud('Operador_Turistico', 'p_cod'));

module.exports = router;