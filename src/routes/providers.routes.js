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
  return ok(
    res,
    {
      basePath: '/api/providers',
      endpoints: [
        { method: 'GET', path: '/api/providers/aerolineas', description: 'Lista todas las aerolíneas disponibles.' },
        { method: 'GET', path: '/api/providers/aerolineas/:id', description: 'Obtiene una aerolínea específica.' },
        { method: 'POST', path: '/api/providers/aerolineas', description: 'Crea una aerolínea validando lugar y fechas.' },
        { method: 'PUT', path: '/api/providers/aerolineas/:id', description: 'Actualiza una aerolínea permitiendo cambios parciales.' },
        { method: 'DELETE', path: '/api/providers/aerolineas/:id', description: 'Elimina una aerolínea si no tiene referencias activas.' }
      ],
      hint: 'Recuerda enviar JSON válido en los métodos POST y PUT.'
    },
    'Rutas para gestión de proveedores disponibles'
  );
});

// Aerolíneas - procedimientos almacenados
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
    const result = await pool.query('CALL sp_obtener_aerolinea_por_id($1)', [aeroId]);
    const payload = result?.rows?.[0];

    if (!payload || payload.cod === null || payload.cod === undefined) {
      return fail(res, 'Aerolínea no encontrada', 404);
    }

    return ok(res, payload, 'Aerolínea obtenida');
  } catch (error) {
    return next(error);
  }
});

router.post('/aerolineas', async (req, res, next) => {
  const { nombre, fecha_constitucion: fechaConstitucion, lugar_cod: lugarCod } = req.body ?? {};

  if (!nombre || !fechaConstitucion || lugarCod === undefined) {
    return fail(res, 'nombre, fecha_constitucion y lugar_cod son obligatorios.');
  }

  const fechaConstitucionDate = parseDateOrNull(fechaConstitucion);
  if (!fechaConstitucionDate) {
    return fail(res, 'fecha_constitucion no tiene un formato válido.');
  }

  const lugarCodInt = parseIntParam(lugarCod);
  if (lugarCodInt === null) {
    return fail(res, 'lugar_cod debe ser un entero válido.');
  }

  try {
    const values = [nombre, fechaConstitucionDate, lugarCodInt];
    const result = await pool.query('CALL sp_crear_aerolinea($1,$2,$3)', values);
    const payload = result?.rows?.[0] ?? {};
    const error = isErrorMessage(payload.p_mensaje);

    if (error) {
      return fail(res, payload.p_mensaje, 400, payload);
    }

    return ok(res, payload, payload.p_mensaje || 'Aerolínea creada', 201);
  } catch (error) {
    return next(error);
  }
});

router.put('/aerolineas/:id', async (req, res, next) => {
  const aeroId = parseIntParam(req.params.id);
  if (aeroId === null) {
    return fail(res, 'El parámetro id debe ser un entero válido.');
  }

  const {
    nombre,
    fecha_afiliacion: fechaAfiliacion,
    fecha_constitucion: fechaConstitucion,
    lugar_cod: lugarCod
  } = req.body ?? {};

  const fechaAfiliacionDate = parseDateOrNull(fechaAfiliacion);
  const fechaConstitucionDate = parseDateOrNull(fechaConstitucion);
  const lugarCodInt = lugarCod !== undefined ? parseIntParam(lugarCod) : null;
  if (lugarCod !== undefined && lugarCodInt === null) {
    return fail(res, 'lugar_cod debe ser un entero válido.');
  }

  try {
    const result = await pool.query('CALL sp_actualizar_aerolinea($1,$2,$3,$4,$5)', [
      aeroId,
      nombre ?? null,
      fechaAfiliacionDate,
      fechaConstitucionDate,
      lugarCodInt
    ]);

    const payload = result?.rows?.[0] ?? {};
    const error = isErrorMessage(payload.p_mensaje);

    if (error) {
      return fail(res, payload.p_mensaje, 400, payload);
    }

    const updated = payload.p_registros_actualizados ?? 0;
    if (updated === 0) {
      return fail(res, 'Aerolínea no encontrada para actualizar', 404, payload);
    }

    return ok(res, payload, 'Aerolínea actualizada');
  } catch (error) {
    return next(error);
  }
});

router.delete('/aerolineas/:id', async (req, res, next) => {
  const aeroId = parseIntParam(req.params.id);
  if (aeroId === null) {
    return fail(res, 'El parámetro id debe ser un entero válido.');
  }

  try {
    const result = await pool.query('CALL sp_eliminar_aerolinea($1)', [aeroId]);
    const payload = result?.rows?.[0] ?? {};

    if (payload.p_eliminada !== true) {
      return fail(res, payload.p_mensaje || 'No se pudo eliminar la aerolínea', 400, payload);
    }

    return ok(res, payload, payload.p_mensaje || 'Aerolínea eliminada');
  } catch (error) {
    return next(error);
  }
});

// Otros proveedores usando el generador CRUD
router.use('/hoteles', generateCrud('Hotel', 'p_cod'));
router.use('/cruceros', generateCrud('Crucero', 'p_cod'));
router.use('/transportes-terrestres', generateCrud('Transporte_Terrestre', 'p_cod'));
router.use('/operadores-turisticos', generateCrud('Operador_Turistico', 'p_cod'));

module.exports = router;
