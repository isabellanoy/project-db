const express = require('express');
const pool = require('../config/db');

const router = express.Router();

const ok = (res, data = null, message = 'OK') => 
  res.status(200).json({ ok: true, data, message });

const fail = (res, message = 'Error', status = 500) => 
  res.status(status).json({ ok: false, data: null, message });

// 1. Listar Promociones
router.get('/', async (_req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_promociones()');
    return ok(res, result.rows);
  } catch (error) {
    return fail(res, error.message);
  }
});

// 2. Registrar Promoción
router.post('/', async (req, res) => {
  const { nombre, porcentaje, id_proveedor, tipo_proveedor, servicios } = req.body;

  if (!nombre || !porcentaje || !id_proveedor || !tipo_proveedor || !servicios) {
    return fail(res, 'Faltan datos obligatorios');
  }

  try {
    // fn_registrar_promocion(nombre, porcentaje, id_prov, tipo_prov, array_servicios)
    const query = 'SELECT * FROM fn_registrar_promocion($1, $2, $3, $4, $5)';
    const values = [
      nombre, 
      parseFloat(porcentaje), 
      parseInt(id_proveedor), 
      tipo_proveedor, 
      servicios // Array de IDs
    ];

    const result = await pool.query(query, values);
    
    if (result.rows[0].exito) {
      return ok(res, { id: result.rows[0].id_promocion }, result.rows[0].mensaje);
    } else {
      return fail(res, result.rows[0].mensaje, 400);
    }
  } catch (error) {
    return fail(res, error.message);
  }
});

// 3. Eliminar Promoción
router.delete('/:id', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_eliminar_promocion($1)', [req.params.id]);
    if (result.rows[0].exito) return ok(res, null, 'Eliminada correctamente');
    return fail(res, result.rows[0].mensaje, 400);
  } catch (error) {
    return fail(res, error.message);
  }
});

// 4. Servicios por Proveedor (Para llenar el select del formulario)
router.get('/services-by-provider', async (req, res) => {
  const { type, providerId } = req.query; // type: 'aerolinea', 'hotel'...
  
  if(!type || !providerId) return fail(res, 'Faltan parámetros');

  let query = '';
  // Mapeo simple para buscar en las tablas base
  switch(type) {
    case 'Aerolinea': query = `SELECT s_cod as id, v_cod_vue as label FROM Vuelo WHERE Aerolinea_p_cod = $1`; break;
    case 'Hotel': query = `SELECT s_cod as id, ha_numero || ' (' || th.th_nombre || ')' as label FROM Habitacion h JOIN Tipo_Habitacion th ON h.Tipo_Habitacion_th_cod = th.th_cod WHERE Hotel_p_cod = $1`; break;
    case 'Crucero': query = `SELECT s_cod as id, 'Salida: ' || to_char(vi_fecha_hora_salida, 'DD/MM/YYYY') as label FROM Viaje WHERE Crucero_p_cod = $1`; break;
    case 'Transporte': query = `SELECT s_cod as id, 'Traslado' as label FROM Traslado WHERE Transporte_Terrestre_p_cod = $1`; break;
    case 'Operador': query = `SELECT s_cod as id, sa_nombre as label FROM Servicio_Adicional WHERE Operador_Turistico_p_cod = $1`; break;
    default: return ok(res, []);
  }

  try {
    const result = await pool.query(query, [providerId]);
    return ok(res, result.rows);
  } catch (error) {
    return fail(res, error.message);
  }
});

module.exports = router;