// src/routes/user.routes.js
const express = require('express');
const pool = require('../config/db');
const router = express.Router();

const ok = (res, data = null, message = 'OK') => res.json({ ok: true, data, message });
const fail = (res, message = 'Error', status = 400) => res.status(status).json({ ok: false, message });

const parseUserId = (req) => {
  const candidate = req.query.usuario_cod ?? req.headers['x-user-id'] ?? req.body?.usuario_cod;
  if (candidate === undefined || candidate === null || candidate === '') return null;
  const parsed = Number(candidate);
  return Number.isNaN(parsed) ? null : parsed;
};

// 1. Listar Reseñas del Usuario
router.get('/reviews', async (req, res) => {
    const userId = parseUserId(req);
    if (!userId) return fail(res, 'Falta el código de usuario (usuario_cod)');

    try {
        const result = await pool.query('SELECT * FROM fn_listar_resenas($1)', [userId]);
        return ok(res, result.rows);
    } catch (e) { return fail(res, e.message, 500); }
});

// 2. Listar Quejas del Usuario
router.get('/complaints', async (req, res) => {
    const userId = parseUserId(req);
    if (!userId) return fail(res, 'Falta el código de usuario (usuario_cod)');
    
    try {
        const result = await pool.query('SELECT * FROM fn_listar_quejas($1)', [userId]);
        return ok(res, result.rows);
    } catch (e) { return fail(res, e.message, 500); }
});

// 3. Listar Reembolsos del Usuario
router.get('/refunds', async (req, res) => {
    const userId = parseUserId(req);
    if (!userId) return fail(res, 'Falta el código de usuario (usuario_cod)');

    try {
        const result = await pool.query('SELECT * FROM fn_listar_reembolsos($1)', [userId]);
        return ok(res, result.rows);
    } catch (e) { return fail(res, e.message, 500); }
});

module.exports = router;
