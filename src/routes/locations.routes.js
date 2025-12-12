const express = require('express');
const pool = require('../config/db');

const router = express.Router();

const ok = (res, data = null, message = 'OK', status = 200) =>
  res.status(status).json({ ok: true, data, message });

const fail = (res, message = 'Error', status = 400, data = null) =>
  res.status(status).json({ ok: false, data, message });

const parseIntParam = (value) => {
  if (value === undefined || value === null || value === '') return null;
  const parsed = Number(value);
  return Number.isInteger(parsed) ? parsed : null;
};

const parseLimit = (value, fallback) => {
  const parsed = Number(value);
  if (Number.isNaN(parsed) || parsed <= 0) return fallback;
  return parsed;
};

const parseOffset = (value, fallback) => {
  const parsed = Number(value);
  if (Number.isNaN(parsed) || parsed < 0) return fallback;
  return parsed;
};

router.get('/', async (req, res, next) => {
  const limit = parseLimit(req.query.limit, 100);
  const offset = parseOffset(req.query.offset, 0);

  try {
    const result = await pool.query('SELECT * FROM fn_buscar_lugares($1,$2)', [limit, offset]);
    return ok(res, result.rows, 'Lugares obtenidos');
  } catch (error) {
    return next(error);
  }
});

router.get('/:id/ancestros', async (req, res, next) => {
  const placeId = parseIntParam(req.params.id);
  if (placeId === null) {
    return fail(res, 'El parámetro id debe ser un entero válido.');
  }

  try {
    const result = await pool.query('SELECT * FROM fn_obtener_ancestros_lugar($1)', [placeId]);
    return ok(res, result.rows, 'Ancestros obtenidos');
  } catch (error) {
    return next(error);
  }
});

router.get('/:id/descendientes', async (req, res, next) => {
  const placeId = parseIntParam(req.params.id);
  if (placeId === null) {
    return fail(res, 'El parámetro id debe ser un entero válido.');
  }

  try {
    const result = await pool.query('SELECT * FROM fn_obtener_descendientes_lugar($1)', [placeId]);
    return ok(res, result.rows, 'Descendientes obtenidos');
  } catch (error) {
    return next(error);
  }
});

router.get('/:id/ruta', async (req, res, next) => {
  const placeId = parseIntParam(req.params.id);
  if (placeId === null) {
    return fail(res, 'El parámetro id debe ser un entero válido.');
  }

  try {
    const result = await pool.query('SELECT fn_obtener_ruta_lugar($1) AS ruta', [placeId]);
    const ruta = result?.rows?.[0]?.ruta ?? null;

    if (!ruta) {
      return fail(res, 'Ruta no encontrada para el lugar indicado', 404);
    }

    return ok(res, { ruta }, 'Ruta obtenida');
  } catch (error) {
    return next(error);
  }
});

router.get('/:id/hijos', async (req, res, next) => {
  const placeId = parseIntParam(req.params.id);
  if (placeId === null) {
    return fail(res, 'El parámetro id debe ser un entero válido.');
  }

  try {
    const result = await pool.query('SELECT * FROM fn_buscar_hijos_lugar($1)', [placeId]);
    return ok(res, result.rows, 'Hijos obtenidos');
  } catch (error) {
    return next(error);
  }
});

module.exports = router;
