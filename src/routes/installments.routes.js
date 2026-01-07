// src/routes/installments.routes.js
const express = require('express');
const pool = require('../config/db');
const router = express.Router();

const ok = (res, data = null, message = 'OK') => res.json({ ok: true, data, message });
const fail = (res, message = 'Error', status = 400) => res.status(status).json({ ok: false, message });

// 1. Obtener Cuotas del Cliente
router.get('/:userId', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM fn_obtener_cuotas_cliente($1)', [req.params.userId]);
        return ok(res, result.rows);
    } catch (e) { return fail(res, e.message); }
});

// 2. Pagar Cuota con Tarjeta
router.post('/pay/card', async (req, res) => {
    const { 
        usuario_id, cuota_id, monto, 
        numero, cvc, titular, vencimiento, banco_id, emisor 
    } = req.body;

    try {
        // fn_pago_cuota_tarjeta(usuario, cuota, monto, numero, cvc, titular, vencimiento, banco, emisor)
        const result = await pool.query(
            'SELECT fn_pago_cuota_tarjeta($1, $2, $3, $4, $5, $6, $7, $8, $9) as exito',
            [usuario_id, cuota_id, monto, numero, cvc, titular, vencimiento, banco_id, emisor]
        );

        if (result.rows[0].exito) return ok(res, null, 'Pago de cuota registrado exitosamente');
        return fail(res, 'Error al registrar el pago');
    } catch (e) { return fail(res, e.message); }
});

// 3. Pagar Cuota con Operación Digital (Zelle/Pago Móvil)
router.post('/pay/digital', async (req, res) => {
    const { usuario_id, cuota_id, monto, referencia } = req.body;

    try {
        // fn_pago_cuota_operacion_digital(usuario, cuota, monto, referencia)
        const result = await pool.query(
            'SELECT fn_pago_cuota_operacion_digital($1, $2, $3, $4) as exito',
            [usuario_id, cuota_id, monto, referencia]
        );

        if (result.rows[0].exito) return ok(res, null, 'Pago digital registrado exitosamente');
        return fail(res, 'Error al registrar el pago');
    } catch (e) { return fail(res, e.message); }
});

module.exports = router;