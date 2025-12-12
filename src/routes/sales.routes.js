const express = require('express');
const pool = require('../config/db');
const { generateCrud } = require('../utils/crudGenerator');

const router = express.Router();

const ok = (res, data = null, message = 'OK', status = 200) =>
  res.status(status).json({ ok: true, data, message });

const fail = (res, message = 'Error', status = 400, data = null) =>
  res.status(status).json({ ok: false, data, message });

// =====================================================================
// RUTAS TRANSACCIONALES (AGREGAR AL CARRITO / ITINERARIO)
// Llaman a las funciones SQL (Store Procedures) para validar y calcular.
// =====================================================================

// 1. Agregar Vuelo
router.post('/add/vuelo', async (req, res) => {
  const { usuario_id, vuelo_id, pasajeros, clase_id } = req.body;

  if (!usuario_id || !vuelo_id || !pasajeros || !clase_id) {
    return fail(res, 'Faltan datos obligatorios (usuario_id, vuelo_id, pasajeros, clase_id)');
  }

  try {
    // Llama a fn_agregar_vuelo_a_compra(usuario, vuelo, pax, clase)
    const result = await pool.query(
      'SELECT fn_agregar_vuelo_a_compra($1, $2, $3, $4) as exito',
      [usuario_id, vuelo_id, pasajeros, clase_id]
    );

    if (result.rows[0].exito) {
      return ok(res, null, 'Vuelo agregado al itinerario exitosamente');
    } else {
      return fail(res, 'No se pudo agregar el vuelo (Verifica disponibilidad o estado de compra)');
    }
  } catch (error) {
    return fail(res, error.message || 'Error al agregar vuelo');
  }
});

// 2. Agregar Alojamiento (Hotel)
router.post('/add/alojamiento', async (req, res) => {
  const { usuario_id, habitacion_id, noches, check_in } = req.body;

  if (!usuario_id || !habitacion_id || !noches || !check_in) {
    return fail(res, 'Faltan datos (usuario_id, habitacion_id, noches, check_in)');
  }

  try {
    const result = await pool.query(
      'SELECT fn_agregar_habitacion_a_compra($1, $2, $3, $4) as exito',
      [usuario_id, habitacion_id, noches, check_in]
    );

    if (result.rows[0].exito) return ok(res, null, 'Alojamiento agregado exitosamente');
    return fail(res, 'No se pudo agregar el alojamiento');
  } catch (error) {
    return fail(res, error.message);
  }
});

// 3. Agregar Crucero (Viaje)
router.post('/add/viaje', async (req, res) => {
  const { usuario_id, viaje_id, pasajeros, camarote_id } = req.body;

  if (!usuario_id || !viaje_id || !pasajeros || !camarote_id) {
    return fail(res, 'Faltan datos requeridos');
  }

  try {
    // p_id_servicio_barco es opcional, enviamos NULL por defecto
    const result = await pool.query(
      'SELECT fn_agregar_viaje_a_compra($1, $2, $3, $4, NULL) as exito',
      [usuario_id, viaje_id, pasajeros, camarote_id]
    );

    if (result.rows[0].exito) return ok(res, null, 'Crucero agregado exitosamente');
    return fail(res, 'No se pudo agregar el crucero');
  } catch (error) {
    return fail(res, error.message);
  }
});

// 4. Agregar Traslado
router.post('/add/traslado', async (req, res) => {
  const { usuario_id, traslado_id, automovil_id, fecha } = req.body;

  if (!usuario_id || !traslado_id || !automovil_id || !fecha) {
    return fail(res, 'Faltan datos requeridos');
  }

  try {
    const result = await pool.query(
      'SELECT fn_agregar_traslado_a_compra($1, $2, $3, $4) as exito',
      [usuario_id, traslado_id, automovil_id, fecha]
    );

    if (result.rows[0].exito) return ok(res, null, 'Traslado agregado exitosamente');
    return fail(res, 'No se pudo agregar el traslado');
  } catch (error) {
    return fail(res, error.message);
  }
});

// 5. Agregar Actividad (Entrada Digital)
router.post('/add/actividad', async (req, res) => {
  const { usuario_id, actividad_id, personas } = req.body;

  try {
    const result = await pool.query(
      'SELECT fn_agregar_entrada_digital_a_compra($1, $2, $3) as exito',
      [usuario_id, actividad_id, personas]
    );

    if (result.rows[0].exito) return ok(res, null, 'Actividad agregada exitosamente');
    return fail(res, 'No se pudo agregar la actividad');
  } catch (error) {
    return fail(res, error.message);
  }
});

// =====================================================================
// RUTAS CRUD (ADMINISTRACIÓN Y CONSULTAS BÁSICAS)
// =====================================================================

const crudMappings = [
  { path: '/compras', table: 'Compra', idField: 'co_cod' },
  { path: '/pagos', table: 'Pago', idField: 'compra_co_cod' }, 
  { path: '/quejas', table: 'Queja', idField: 'q_cod' },
  { path: '/resenas', table: 'Resena', idField: 'r_cod' },
  { path: '/reembolsos', table: 'Reembolso', idField: 'ree_cod' }
];

crudMappings.forEach(({ path, table, idField }) => {
  router.use(path, generateCrud(table, idField));
});

module.exports = router;