// src/routes/wishlist.routes.js
const express = require('express');
const pool = require('../config/db');
const router = express.Router();

const ok = (res, data = null, message = 'OK') => res.json({ ok: true, data, message });
const fail = (res, message = 'Error', status = 400) => res.status(status).json({ ok: false, message });

// 1. Agregar Servicio a Deseos
router.post('/service', async (req, res) => {
    const { usuario_id, servicio_id } = req.body;
    try {
        const result = await pool.query('SELECT fn_agregar_servicio_deseo($1, $2) as exito', [usuario_id, servicio_id]);
        if (result.rows[0].exito) return ok(res, null, 'Servicio agregado a deseos');
        return fail(res, 'No se pudo agregar (quizás ya existe o el servicio no es válido)');
    } catch (e) { return fail(res, e.message); }
});

// 2. Agregar Paquete a Deseos
router.post('/package', async (req, res) => {
    const { usuario_id, paquete_id } = req.body;
    try {
        const result = await pool.query('SELECT fn_agregar_paquete_deseo($1, $2) as exito', [usuario_id, paquete_id]);
        if (result.rows[0].exito) return ok(res, null, 'Paquete agregado a deseos');
        return fail(res, 'No se pudo agregar el paquete');
    } catch (e) { return fail(res, e.message); }
});

// 3. Eliminar Servicio de Deseos
router.delete('/service', async (req, res) => {
    const { usuario_id, servicio_id } = req.body;
    try {
        const result = await pool.query('SELECT fn_eliminar_servicio_deseo($1, $2) as exito', [usuario_id, servicio_id]);
        if (result.rows[0].exito) return ok(res, null, 'Eliminado de deseos');
        return fail(res, 'No se pudo eliminar');
    } catch (e) { return fail(res, e.message); }
});

// 4. Eliminar Paquete de Deseos
router.delete('/package', async (req, res) => {
    const { usuario_id, paquete_id } = req.body;
    try {
        const result = await pool.query('SELECT fn_eliminar_paquete_deseo($1, $2) as exito', [usuario_id, paquete_id]);
        if (result.rows[0].exito) return ok(res, null, 'Eliminado de deseos');
        return fail(res, 'No se pudo eliminar');
    } catch (e) { return fail(res, e.message); }
});

// 5. Consultar Deseos (Servicios)
router.get('/services/:userId', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM fn_ver_deseos_servicios($1)', [req.params.userId]);
        return ok(res, result.rows);
    } catch (e) { return fail(res, e.message); }
});

// 6. Consultar Deseos (Paquetes)
router.get('/packages/:userId', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM fn_ver_deseos_paquetes($1)', [req.params.userId]);
        return ok(res, result.rows);
    } catch (e) { return fail(res, e.message); }
});

module.exports = router;