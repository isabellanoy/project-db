const express = require('express');
const pool = require('../config/db');
const router = express.Router();

const ok = (res, data) => res.json({ ok: true, data });
const fail = (res, msg) => res.status(400).json({ ok: false, message: msg });

// 1. Listar Usuarios con su Rol actual
router.get('/', async (req, res) => {
  try {
    const result = await pool.query(`
      SELECT u.u_cod, u.u_username, u.u_correo, r.ro_nombre, r.ro_cod
      FROM Usuario u
      JOIN Rol r ON u.Rol_ro_cod = r.ro_cod
      ORDER BY u.u_cod DESC
    `);
    ok(res, result.rows);
  } catch (err) { fail(res, err.message); }
});

// 2. Asignar nuevo Rol a Usuario
router.put('/:id/role', async (req, res) => {
  const { roleId } = req.body;
  const userId = req.params.id;

  if (!roleId) return fail(res, 'Falta el ID del rol');

  try {
    // Actualización directa en la tabla Usuario
    await pool.query('UPDATE Usuario SET Rol_ro_cod = $1 WHERE u_cod = $2', [roleId, userId]);
    ok(res, { message: 'Rol actualizado correctamente' });
  } catch (err) { fail(res, err.message); }
});

module.exports = router;