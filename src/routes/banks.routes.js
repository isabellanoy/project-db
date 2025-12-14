const express = require('express');
const pool = require('../config/db');

const router = express.Router();

const ok = (res, data = null, message = 'OK', status = 200) =>
  res.status(status).json({ ok: true, data, message });

const fail = (res, message = 'Error', status = 500) =>
  res.status(status).json({ ok: false, data: null, message });

router.get('/banks', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM Banco ORDER BY ba_nombre');
        return ok(res, result.rows, 'Bancos obtenidos');
    } catch (error) {
        return fail(res, error.message);
    }
});

module.exports = router;
