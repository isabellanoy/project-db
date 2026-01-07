// src/routes/interactions.routes.js
const express = require('express');
const pool = require('../config/db');
const router = express.Router();

const ok = (res, data = null, message = 'OK') => res.json({ ok: true, data, message });
const fail = (res, message = 'Error', status = 400) => res.status(status).json({ ok: false, message });

// 1. Obtener Detalle de Reservas de una Compra
router.get('/details/:compraId', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM fn_obtener_reservas_compra($1)', [req.params.compraId]);
        return ok(res, result.rows);
    } catch (e) { return fail(res, e.message); }
});

// 2. Solicitar Reembolso
router.post('/refund', async (req, res) => {
    const { usuario_id, compra_id, servicio_id, razon } = req.body;
    try {
        // fn_solicitar_reembolso(usuario, compra, servicio, razon) -> BOOLEAN
        const result = await pool.query(
            'SELECT fn_solicitar_reembolso($1, $2, $3, $4) as exito', 
            [usuario_id, compra_id, servicio_id, razon]
        );
        
        if (result.rows[0].exito) return ok(res, null, 'Reembolso solicitado exitosamente');
        return fail(res, 'No se pudo procesar el reembolso (Verifique condiciones: compra finalizada, no paquete, no anulado)');
    } catch (e) { return fail(res, e.message); }
});

// 3. Crear Queja (Reclamo)
router.post('/complaint', async (req, res) => {
    const { usuario_id, compra_id, servicio_id, descripcion } = req.body;
    try {
        // fn_presentar_queja(...)
        const result = await pool.query(
            'SELECT fn_presentar_queja($1, $2, $3, $4) as exito',
            [usuario_id, compra_id, servicio_id, descripcion]
        );
        if (result.rows[0].exito) return ok(res, null, 'Reclamo registrado');
        return fail(res, 'No se pudo registrar el reclamo');
    } catch (e) { return fail(res, e.message); }
});

// 4. Crear Reseña (Valoración)
router.post('/review', async (req, res) => {
    const { usuario_id, compra_id, servicio_id, calificacion, comentario } = req.body;
    try {
        // fn_presentar_valoracion(...)
        const result = await pool.query(
            'SELECT fn_presentar_valoracion($1, $2, $3, $4, $5) as exito',
            [usuario_id, compra_id, servicio_id, calificacion, comentario]
        );
        if (result.rows[0].exito) return ok(res, null, 'Reseña registrada');
        return fail(res, 'No se pudo registrar la reseña');
    } catch (e) { return fail(res, e.message); }
});

module.exports = router;