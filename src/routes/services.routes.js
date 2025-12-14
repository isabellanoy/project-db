const express = require('express');
const pool = require('../config/db');
const { generateCrud } = require('../utils/crudGenerator');

const router = express.Router();

const ok = (res, data = null, message = 'OK', status = 200) => 
  res.status(status).json({ ok: true, data, message });

const fail = (res, message = 'Error', status = 500) => 
  res.status(status).json({ ok: false, data: null, message });

// --- UTILIDAD: TASA DE CAMBIO ---
router.get('/tasa', async (req, res) => {
  try {
    const result = await pool.query("SELECT factor_tasa FROM fn_obtener_tasa_actual('USD')");
    const tasa = result.rows.length > 0 ? parseFloat(result.rows[0].factor_tasa) : 1;
    return ok(res, { tasa }, 'Tasa obtenida');
  } catch (error) {
    return fail(res, error.message);
  }
});

// --- RUTAS DE CATÁLOGO (VISTAS PÚBLICAS) ---

router.get('/catalog/vuelos', async (_req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_vuelos()');
    return ok(res, result.rows);
  } catch (error) { return fail(res, error.message); }
});

router.get('/catalog/viajes', async (_req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_viajes()');
    return ok(res, result.rows);
  } catch (error) { return fail(res, error.message); }
});

router.get('/catalog/alojamientos', async (_req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_habitaciones()');
    return ok(res, result.rows);
  } catch (error) { return fail(res, error.message); }
});

router.get('/catalog/traslados', async (_req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_traslados()');
    return ok(res, result.rows);
  } catch (error) { return fail(res, error.message); }
});

router.get('/catalog/actividades', async (_req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_servicios_adicionales()');
    return ok(res, result.rows);
  } catch (error) { return fail(res, error.message); }
});

// 1. Listar Paquetes (Catálogo)
router.get('/catalog/paquetes', async (_req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_paquetes_turisticos()');
    return ok(res, result.rows);
  } catch (error) { return fail(res, error.message); }
});

// --- RUTAS DE DETALLE (POR ID) ---

router.get('/catalog/vuelos/:id', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_vuelos() WHERE cod_servicio = $1', [req.params.id]);
    if (result.rows.length === 0) return fail(res, 'No encontrado', 404);
    return ok(res, result.rows[0]);
  } catch (error) { return fail(res, error.message); }
});

router.get('/catalog/alojamientos/:id', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_habitaciones() WHERE cod_servicio = $1', [req.params.id]);
    if (result.rows.length === 0) return fail(res, 'No encontrado', 404);
    return ok(res, result.rows[0]);
  } catch (error) { return fail(res, error.message); }
});

router.get('/catalog/viajes/:id', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_viajes() WHERE cod_servicio = $1', [req.params.id]);
    if (result.rows.length === 0) return fail(res, 'No encontrado', 404);
    return ok(res, result.rows[0]);
  } catch (error) { return fail(res, error.message); }
});

router.get('/catalog/traslados/:id', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_traslados() WHERE cod_servicio = $1', [req.params.id]);
    if (result.rows.length === 0) return fail(res, 'No encontrado', 404);
    return ok(res, result.rows[0]);
  } catch (error) { return fail(res, error.message); }
});

router.get('/catalog/actividades/:id', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_servicios_adicionales() WHERE cod_servicio = $1', [req.params.id]);
    if (result.rows.length === 0) return fail(res, 'No encontrado', 404);
    return ok(res, result.rows[0]);
  } catch (error) { return fail(res, error.message); }
});

// 2. Detalle de Paquete (Info + Servicios incluidos)
router.get('/catalog/paquetes/:id', async (req, res) => {
  const id = parseInt(req.params.id);
  try {
    const infoRes = await pool.query('SELECT * FROM fn_obtener_paquete_por_id($1)', [id]);
    if (infoRes.rows.length === 0) return fail(res, 'Paquete no encontrado', 404);

    const servRes = await pool.query('SELECT * FROM fn_obtener_servicios_paquete($1)', [id]);

    const paquete = {
      ...infoRes.rows[0],
      servicios: servRes.rows.map(r => r.cod_servicio)
    };
    return ok(res, paquete);
  } catch (error) { return fail(res, error.message); }
});

// --- GESTIÓN ADMINISTRATIVA (CREAR PAQUETE) ---
router.post('/paquetes', async (req, res) => {
  const { nombre, descripcion, personas, costo, costo_millas, servicios, restriccion } = req.body;

  if (!nombre || !descripcion || !personas || !costo || !costo_millas) {
    return fail(res, 'Faltan campos obligatorios', 400);
  }

  try {
    // Usamos el Stored Procedure definido en LOGIC.sql
    const query = 'CALL sp_crear_paquete_turistico(null, $1, $2, $3, $4, $5, $6, $7)';
    const values = [
      nombre, 
      descripcion, 
      parseInt(personas), 
      parseFloat(costo), 
      parseInt(costo_millas), 
      servicios || [], 
      restriccion || null
    ];

    await pool.query(query, values);
    return ok(res, null, 'Paquete creado exitosamente', 201);
  } catch (error) {
    return fail(res, error.message);
  }
});

// --- RUTAS CRUD GENÉRICAS ---
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