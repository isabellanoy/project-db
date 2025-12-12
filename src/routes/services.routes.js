const express = require('express');
const pool = require('../config/db');
const { generateCrud } = require('../utils/crudGenerator');

const router = express.Router();

const ok = (res, data = null, message = 'OK') => 
  res.status(200).json({ ok: true, data, message });

const fail = (res, message = 'Error', status = 500) => 
  res.status(status).json({ ok: false, data: null, message });

// --- RUTAS DE CATÁLOGO (VISTAS PÚBLICAS) ---
// Estas rutas usan las funciones SQL 'fn_listar_...' para mostrar datos enriquecidos al usuario

// 1. Catálogo de Vuelos
router.get('/catalog/vuelos', async (_req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_vuelos()');
    return ok(res, result.rows, 'Catálogo de vuelos obtenido');
  } catch (error) {
    console.error(error);
    return fail(res, 'Error al obtener vuelos');
  }
});

// 2. Catálogo de Viajes (Cruceros)
router.get('/catalog/viajes', async (_req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_viajes()');
    return ok(res, result.rows, 'Catálogo de cruceros obtenido');
  } catch (error) {
    return fail(res, 'Error al obtener cruceros');
  }
});

// 3. Catálogo de Alojamientos (Hoteles/Habitaciones)
router.get('/catalog/alojamientos', async (_req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_habitaciones()');
    return ok(res, result.rows, 'Catálogo de alojamientos obtenido');
  } catch (error) {
    return fail(res, 'Error al obtener alojamientos');
  }
});

// 4. Catálogo de Traslados
router.get('/catalog/traslados', async (_req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_traslados()');
    return ok(res, result.rows, 'Catálogo de traslados obtenido');
  } catch (error) {
    return fail(res, 'Error al obtener traslados');
  }
});

// 5. Catálogo de Actividades (Servicios Adicionales)
router.get('/catalog/actividades', async (_req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_servicios_adicionales()');
    return ok(res, result.rows, 'Catálogo de actividades obtenido');
  } catch (error) {
    return fail(res, 'Error al obtener actividades');
  }
});

// --- RUTAS CRUD (ADMINISTRATIVAS / DETALLE) ---
const serviceMappings = [
  { path: '/vuelos', table: 'Vuelo', idField: 's_cod' },
  { path: '/viajes', table: 'Viaje', idField: 's_cod' },
  { path: '/traslados', table: 'Traslado', idField: 's_cod' },
  { path: '/habitaciones', table: 'Habitacion', idField: 's_cod' },
  { path: '/servicios-adicionales', table: 'Servicio_Adicional', idField: 's_cod' },
  { path: '/servicios-barco', table: 'Servicio_Barco', idField: 'sb_cod' }
];

serviceMappings.forEach(({ path, table, idField }) => {
  router.use(path, generateCrud(table, idField));
});

router.use('/', generateCrud('Servicio', 's_cod'));

module.exports = router;