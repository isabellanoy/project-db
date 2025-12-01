const express = require('express');
const pool = require('../config/db');

const router = express.Router();

const parseIntegerOrNull = (value) => {
  if (value === undefined || value === null || value === '') return null;
  const parsed = Number(value);
  return Number.isInteger(parsed) ? parsed : null;
};

const parseIntegerArray = (value) => {
  if (value === undefined || value === null) return null;

  if (Array.isArray(value)) {
    const parsed = value.map((item) => parseIntegerOrNull(item)).filter((item) => item !== null);
    return parsed.length ? parsed : null;
  }

  if (typeof value === 'string') {
    const parsed = value
      .split(',')
      .map((item) => parseIntegerOrNull(item.trim()))
      .filter((item) => item !== null);
    return parsed.length ? parsed : null;
  }

  return null;
};

router.get('/roles', async (_req, res, next) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_todos_roles()');
    return res.json({ ok: true, data: result.rows, message: 'Roles obtenidos' });
  } catch (error) {
    return next(error);
  }
});

router.get('/roles/:id', async (req, res, next) => {
  const roleId = parseIntegerOrNull(req.params.id);
  if (roleId === null) {
    return res.status(400).json({ ok: false, message: 'El parámetro id debe ser un entero válido' });
  }

  try {
    const result = await pool.query('SELECT * FROM fn_obtener_rol_con_permisos($1)', [roleId]);
    const payload = result?.rows?.[0];

    if (!payload || payload.exito === false) {
      return res.status(404).json(payload ?? { ok: false, message: 'Rol no encontrado' });
    }

    return res.json({ ok: true, data: payload, message: 'Rol obtenido' });
  } catch (error) {
    return next(error);
  }
});

router.post('/roles', async (req, res, next) => {
  const { nombre, permisos } = req.body ?? {};

  if (!nombre || typeof nombre !== 'string' || !nombre.trim()) {
    return res.status(400).json({ ok: false, message: 'El campo nombre es requerido' });
  }

  const permisosArray = parseIntegerArray(permisos);

  try {
    const result = await pool.query('SELECT * FROM fn_crear_rol_con_permisos($1,$2)', [
      nombre.trim(),
      permisosArray
    ]);
  const payload = result?.rows?.[0] ?? {};
  const success = payload.exito !== false;
  const message = payload.mensaje || (success ? 'Rol creado' : 'No se pudo crear el rol');
  return res.status(success ? 201 : 400).json({ ok: success, data: payload, message });
  } catch (error) {
    return next(error);
  }
});

router.put('/roles/:id/permisos/add', async (req, res, next) => {
  const roleId = parseIntegerOrNull(req.params.id);
  if (roleId === null) {
    return res.status(400).json({ ok: false, message: 'El parámetro id debe ser un entero válido' });
  }

  const permisosArray = parseIntegerArray(req.body?.permisos);
  if (!permisosArray) {
    return res.status(400).json({ ok: false, message: 'Debe proporcionar al menos un permiso válido' });
  }

  try {
    const result = await pool.query('SELECT * FROM fn_agregar_permisos_a_rol($1,$2)', [roleId, permisosArray]);
  const payload = result?.rows?.[0] ?? {};
  const success = payload.exito !== false;
  const message = payload.mensaje || (success ? 'Permisos agregados' : 'No se pudieron agregar los permisos');
  return res.status(success ? 200 : 400).json({ ok: success, data: payload, message });
  } catch (error) {
    return next(error);
  }
});

router.put('/roles/:id/permisos/remove', async (req, res, next) => {
  const roleId = parseIntegerOrNull(req.params.id);
  if (roleId === null) {
    return res.status(400).json({ ok: false, message: 'El parámetro id debe ser un entero válido' });
  }

  const permisosArray = parseIntegerArray(req.body?.permisos);
  if (!permisosArray) {
    return res.status(400).json({ ok: false, message: 'Debe proporcionar al menos un permiso válido' });
  }

  try {
    const result = await pool.query('SELECT * FROM fn_quitar_permisos_de_rol($1,$2)', [roleId, permisosArray]);
  const payload = result?.rows?.[0] ?? {};
  const success = payload.exito !== false;
  const message = payload.mensaje || (success ? 'Permisos removidos' : 'No se pudieron remover los permisos');
  return res.status(success ? 200 : 400).json({ ok: success, data: payload, message });
  } catch (error) {
    return next(error);
  }
});

router.get('/permisos', async (_req, res, next) => {
  try {
    const result = await pool.query('SELECT * FROM fn_listar_permisos_disponibles()');
    return res.json({ ok: true, data: result.rows, message: 'Permisos disponibles' });
  } catch (error) {
    return next(error);
  }
});

module.exports = router;
