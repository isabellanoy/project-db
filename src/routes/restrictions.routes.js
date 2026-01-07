// src/routes/restrictions.routes.js
const express = require('express');
const pool = require('../config/db');
const router = express.Router();

const ok = (res, data = null, message = 'OK') => res.json({ ok: true, data, message });
const fail = (res, message = 'Error', status = 400) => res.status(status).json({ ok: false, message });

// 1. Listar Restricciones
router.get('/', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM fn_listar_restricciones_paquete()');
        return ok(res, result.rows);
    } catch (e) { return fail(res, e.message); }
});

// 2. Crear Restricción
router.post('/', async (req, res) => {
    const { caracteristica, operador, valor } = req.body;
    
    if (!caracteristica || !operador || !valor) {
        return fail(res, 'Faltan datos (caracteristica, operador, valor)');
    }

    try {
        // sp_crear_restriccion_paquete(OUT id, caracteristica, operador, valor)
        
        // Simulación de llamada para capturar el OUT (o ignorarlo si no es crítico devolverlo)
        const result = await pool.query(
            `DO $$
             DECLARE new_id INT;
             BEGIN
                CALL sp_crear_restriccion_paquete(new_id, '${caracteristica}', '${operador}', '${valor}');
             END $$;`
        );
        
        return ok(res, null, 'Restricción creada exitosamente');
    } catch (e) { return fail(res, e.message); }
});

// 3. Eliminar Restricción
router.delete('/:id', async (req, res) => {
    try {
        // sp_eliminar_restriccion_paquete(id, OUT mensaje)
        // Usamos un query simple asumiendo que el SP lanza excepcion si falla
        await pool.query(`CALL sp_eliminar_restriccion_paquete($1, null)`, [req.params.id]);
        return ok(res, null, 'Restricción eliminada');
    } catch (e) { 
        // Capturar mensajes de error de SQL (ej: "La restriccion esta en uso")
        return fail(res, e.message); 
    }
});

module.exports = router;