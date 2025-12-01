const express = require('express');
const pool = require('../config/db');

const ok = (data = null, message = 'OK') => ({ ok: true, data, message });
const fail = (message = 'Error', data = null) => ({ ok: false, data, message });

const formatValue = (value) => {
  if (value instanceof Date) return value;
  if (typeof value === 'string' && !Number.isNaN(Date.parse(value))) {
    const date = new Date(value);
    if (!Number.isNaN(date.getTime())) {
      return date;
    }
  }
  return value;
};

const buildInsertQuery = (tableName, fields) => {
  const placeholders = fields.map((_, index) => `$${index + 1}`).join(', ');
  return `INSERT INTO ${tableName} (${fields.join(', ')}) VALUES (${placeholders}) RETURNING *`;
};

const buildUpdateQuery = (tableName, fields, idField) => {
  const setClause = fields.map((field, index) => `${field} = $${index + 1}`).join(', ');
  return `UPDATE ${tableName} SET ${setClause} WHERE ${idField} = $${fields.length + 1} RETURNING *`;
};

function generateCrud(tableName, idField = 'id') {
  const router = express.Router();

  router.get('/', async (_req, res, next) => {
    try {
      const result = await pool.query(`SELECT * FROM ${tableName} ORDER BY ${idField}`);
      return res.json(ok(result.rows));
    } catch (error) {
      return next(error);
    }
  });

  router.get('/:id', async (req, res, next) => {
    try {
      const result = await pool.query(
        `SELECT * FROM ${tableName} WHERE ${idField} = $1 LIMIT 1`,
        [req.params.id]
      );

      if (!result.rows.length) {
        return res.status(404).json(fail('Registro no encontrado'));
      }


      return res.json(ok(result.rows[0]));
    } catch (error) {
      return next(error);
    }
  });

  router.post('/', async (req, res, next) => {
    const payload = req.body || {};
    const fields = Object.keys(payload);

    if (!fields.length) {
      return res.status(400).json(fail('El cuerpo de la petición está vacío'));
    }

    try {
      const query = buildInsertQuery(tableName, fields);
      const values = fields.map((field) => formatValue(payload[field]));
      const result = await pool.query(query, values);
      return res.status(201).json(ok(result.rows[0], 'Registro creado'));
    } catch (error) {
      return next(error);
    }
  });

  router.put('/:id', async (req, res, next) => {
    const payload = req.body || {};
    const fields = Object.keys(payload);

    if (!fields.length) {
      return res.status(400).json(fail('No se proporcionaron campos para actualizar'));
    }

    try {
      const query = buildUpdateQuery(tableName, fields, idField);
      const values = [...fields.map((field) => formatValue(payload[field])), req.params.id];
      const result = await pool.query(query, values);

      if (!result.rows.length) {
        return res.status(404).json(fail('Registro no encontrado para actualizar'));
      }

      return res.json(ok(result.rows[0], 'Registro actualizado'));
    } catch (error) {
      return next(error);
    }
  });

  router.delete('/:id', async (req, res, next) => {
    try {
      const result = await pool.query(
        `DELETE FROM ${tableName} WHERE ${idField} = $1 RETURNING *`,
        [req.params.id]
      );

      if (!result.rows.length) {
        return res.status(404).json(fail('Registro no encontrado para eliminar'));
      }

      return res.json(ok(result.rows[0], 'Registro eliminado'));
    } catch (error) {
      return next(error);
    }
  });

  return router;
}

module.exports = { generateCrud };
