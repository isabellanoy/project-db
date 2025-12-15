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

router.get('/catalog/vuelos/:id/clases', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_clases_asiento_vuelo($1)', [req.params.id]);
    return ok(res, result.rows);
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

router.get('/catalog/viajes/:id/camarotes', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_tipos_camarote_viaje($1)', [req.params.id]);
    return ok(res, result.rows);
  } catch (error) { return fail(res, error.message); }
});

router.get('/catalog/viajes/:id/servicios', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_servicios_viaje($1)', [req.params.id]);
    return ok(res, result.rows);
  } catch (error) { return fail(res, error.message); }
});

router.get('/catalog/traslados/:id', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_traslados() WHERE cod_servicio = $1', [req.params.id]);
    if (result.rows.length === 0) return fail(res, 'No encontrado', 404);
    return ok(res, result.rows[0]);
  } catch (error) { return fail(res, error.message); }
});

router.get('/catalog/traslados/:id/vehiculos', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_vehiculos_traslado($1)', [req.params.id]);
    return ok(res, result.rows);
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
    
    const dbPackage = infoRes.rows[0];
    const paquete = {
      pt_cod: dbPackage.cod,
      pt_nombre: dbPackage.nombre,
      pt_descripcion: dbPackage.descripcion,
      pt_cant_personas: dbPackage.cant_personas,
      pt_costo: dbPackage.costo,
      pt_costo_millas: dbPackage.costo_millas,
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

// --- GESTIÓN DE PAQUETES (CRUD) ---

// 1. Eliminar Paquete
router.delete('/paquetes/:id', async (req, res) => {
  try {
    // sp_eliminar_paquete_turistico
    await pool.query('CALL sp_eliminar_paquete_turistico($1, null)', [req.params.id]);
    return ok(res, null, 'Paquete eliminado correctamente');
  } catch (error) {
    return fail(res, error.message);
  }
});

// 2. Actualizar Paquete (Info básica)
router.put('/paquetes/:id', async (req, res) => {
  const { nombre, descripcion, personas, costo, costo_millas, restriccion } = req.body;
  try {
    // sp_actualizar_paquete_turistico
    await pool.query('CALL sp_actualizar_paquete_turistico(null, $1, $2, $3, $4, $5, $6, $7)', [
      parseInt(req.params.id),
      nombre, 
      descripcion, 
      personas ? parseInt(personas) : null, 
      costo ? parseFloat(costo) : null, 
      costo_millas ? parseInt(costo_millas) : null,
      restriccion ? parseInt(restriccion) : null
    ]);
    return ok(res, null, 'Paquete actualizado');
  } catch (error) {
    return fail(res, error.message);
  }
});

// 3. Listar TODOS los servicios (Para el selector de creación de paquete)
router.get('/options/all-services', async (req, res) => {
  try {
    // Query manual unificando tablas para obtener nombres
    const query = `
      SELECT s.s_cod as id, v.v_cod_vue || ' (Vuelo)' as label, 'Vuelo' as type FROM Vuelo v JOIN Servicio s ON v.s_cod = s.s_cod
      UNION ALL
      SELECT s.s_cod as id, h.p_nombre || ' - ' || ha.ha_numero || ' (Habitación)' as label, 'Hotel' as type FROM Habitacion ha JOIN Hotel h ON ha.Hotel_p_cod = h.p_cod JOIN Servicio s ON ha.s_cod = s.s_cod
      UNION ALL
      SELECT s.s_cod as id, b.b_nombre || ' (Crucero)' as label, 'Crucero' as type FROM Viaje vi JOIN Barco b ON vi.Barco_mt_cod = b.mt_cod JOIN Servicio s ON vi.s_cod = s.s_cod
      UNION ALL
      SELECT s.s_cod as id, 'Traslado a ' || l.l_nombre as label, 'Traslado' as type FROM Traslado t JOIN Lugar l ON t.Lugar_l_cod = l.l_cod JOIN Servicio s ON t.s_cod = s.s_cod
      UNION ALL
      SELECT s.s_cod as id, sa.sa_nombre || ' (Actividad)' as label, 'Actividad' as type FROM Servicio_Adicional sa JOIN Servicio s ON sa.s_cod = s.s_cod
    `;
    const result = await pool.query(query);
    return ok(res, result.rows);
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