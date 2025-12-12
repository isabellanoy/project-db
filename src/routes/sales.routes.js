const express = require('express');
const pool = require('../config/db');
const { generateCrud } = require('../utils/crudGenerator');

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

const parseNumeric = (value) => {
  if (value === undefined || value === null || value === '') return null;
  const parsed = Number(value);
  return Number.isNaN(parsed) ? null : parsed;
};

const parseBoolean = (value, fallback = null) => {
  if (value === undefined || value === null || value === '') return fallback;
  if (typeof value === 'boolean') return value;
  if (typeof value === 'string') {
    const normalized = value.trim().toLowerCase();
    if (['true', '1', 'yes', 'si', 'sí'].includes(normalized)) return true;
    if (['false', '0', 'no'].includes(normalized)) return false;
  }
  return Boolean(value);
};

const parseDate = (value) => {
  if (!value) return null;
  const date = new Date(value);
  return Number.isNaN(date.getTime()) ? null : date;
};

const crudMappings = [
  { path: '/compras', table: 'Compra', idField: 'co_cod' },
  { path: '/reembolsos', table: 'Reembolso', idField: 'ree_cod' },
  { path: '/quejas', table: 'Queja', idField: 'q_cod' },
  { path: '/resenas', table: 'Resena', idField: 'r_cod' }
];

crudMappings.forEach(({ path, table, idField }) => {
  router.use(path, generateCrud(table, idField));
});

router.get('/pagos', async (_req, res, next) => {
  try {
    const result = await pool.query('SELECT * FROM Pago ORDER BY Compra_co_cod, Metodo_Pago_mp_cod');
    return ok(res, result.rows, 'Pagos obtenidos');
  } catch (error) {
    return next(error);
  }
});

router.get('/pagos/:compraId/:metodoId', async (req, res, next) => {
  const compraId = parseIntParam(req.params.compraId);
  const metodoId = parseIntParam(req.params.metodoId);

  if (compraId === null || metodoId === null) {
    return fail(res, 'compraId y metodoId deben ser enteros válidos.');
  }

  try {
    const result = await pool.query(
      `SELECT * FROM Pago WHERE Compra_co_cod = $1 AND Metodo_Pago_mp_cod = $2 LIMIT 1`,
      [compraId, metodoId]
    );

    if (!result.rows.length) {
      return fail(res, 'Pago no encontrado', 404);
    }

    return ok(res, result.rows[0]);
  } catch (error) {
    return next(error);
  }
});

router.post('/pagos', async (req, res, next) => {
  const {
    compra_co_cod: compraId,
    metodo_pago_mp_cod: metodoId,
    pa_monto: monto,
    pa_fecha_hora: fechaHora
  } = req.body ?? {};

  const missing = [];
  if (compraId === undefined) missing.push('compra_co_cod');
  if (metodoId === undefined) missing.push('metodo_pago_mp_cod');
  if (monto === undefined) missing.push('pa_monto');
  if (fechaHora === undefined) missing.push('pa_fecha_hora');
  if (missing.length) {
    return fail(res, `Campos requeridos: ${missing.join(', ')}`, 400, { missing });
  }

  const compraParsed = parseIntParam(compraId);
  const metodoParsed = parseIntParam(metodoId);
  const montoParsed = parseNumeric(monto);
  const fechaParsed = parseDate(fechaHora);

  if (compraParsed === null || metodoParsed === null) {
    return fail(res, 'compra_co_cod y metodo_pago_mp_cod deben ser enteros válidos.');
  }

  if (montoParsed === null) {
    return fail(res, 'pa_monto debe ser numérico.');
  }

  if (!fechaParsed) {
    return fail(res, 'pa_fecha_hora debe tener un formato válido.');
  }

  try {
    const query = `
      INSERT INTO Pago (Compra_co_cod, Metodo_Pago_mp_cod, pa_monto, pa_fecha_hora)
      VALUES ($1, $2, $3, $4)
      RETURNING *`;
    const values = [compraParsed, metodoParsed, montoParsed, fechaParsed];
    const result = await pool.query(query, values);
    return ok(res, result.rows[0], 'Pago registrado', 201);
  } catch (error) {
    return next(error);
  }
});

router.put('/pagos/:compraId/:metodoId', async (req, res, next) => {
  const compraId = parseIntParam(req.params.compraId);
  const metodoId = parseIntParam(req.params.metodoId);

  if (compraId === null || metodoId === null) {
    return fail(res, 'compraId y metodoId deben ser enteros válidos.');
  }

  const { pa_monto: monto, pa_fecha_hora: fechaHora } = req.body ?? {};

  if (monto === undefined && fechaHora === undefined) {
    return fail(res, 'Debe proporcionar pa_monto o pa_fecha_hora para actualizar.');
  }

  const fields = [];
  const values = [];

  if (monto !== undefined) {
    const parsedMonto = parseNumeric(monto);
    if (parsedMonto === null) {
      return fail(res, 'pa_monto debe ser numérico.');
    }
    fields.push('pa_monto = $' + (fields.length + 3));
    values.push(parsedMonto);
  }

  if (fechaHora !== undefined) {
    const parsedFecha = parseDate(fechaHora);
    if (!parsedFecha) {
      return fail(res, 'pa_fecha_hora debe tener un formato válido.');
    }
    fields.push('pa_fecha_hora = $' + (fields.length + 3));
    values.push(parsedFecha);
  }

  if (!fields.length) {
    return fail(res, 'No se proporcionaron campos válidos para actualizar.');
  }

  try {
    const query = `
      UPDATE Pago
      SET ${fields.join(', ')}
      WHERE Compra_co_cod = $1 AND Metodo_Pago_mp_cod = $2
      RETURNING *`;
    const result = await pool.query(query, [compraId, metodoId, ...values]);

    if (!result.rows.length) {
      return fail(res, 'Pago no encontrado para actualizar', 404);
    }

    return ok(res, result.rows[0], 'Pago actualizado');
  } catch (error) {
    return next(error);
  }
});

router.delete('/pagos/:compraId/:metodoId', async (req, res, next) => {
  const compraId = parseIntParam(req.params.compraId);
  const metodoId = parseIntParam(req.params.metodoId);

  if (compraId === null || metodoId === null) {
    return fail(res, 'compraId y metodoId deben ser enteros válidos.');
  }

  try {
    const result = await pool.query(
      `DELETE FROM Pago WHERE Compra_co_cod = $1 AND Metodo_Pago_mp_cod = $2 RETURNING *`,
      [compraId, metodoId]
    );

    if (!result.rows.length) {
      return fail(res, 'Pago no encontrado para eliminar', 404);
    }

    return ok(res, result.rows[0], 'Pago eliminado');
  } catch (error) {
    return next(error);
  }
});

router.post('/compras/:compraId/boletos-vuelo', async (req, res, next) => {
  const compraId = parseIntParam(req.params.compraId);
  if (compraId === null) {
    return fail(res, 'El parámetro compraId debe ser un entero válido.');
  }

  const {
    vuelo_s_cod: vueloId,
    res_costo_sub_total: costo,
    res_anulado,
    bv_cant_pasajeros: cantidadPasajeros,
    clase_asiento_ca_cod: claseId,
    tasa_cambio_tca_cod: tasaId
  } = req.body ?? {};

  const missing = [];
  if (vueloId === undefined) missing.push('vuelo_s_cod');
  if (costo === undefined) missing.push('res_costo_sub_total');
  if (cantidadPasajeros === undefined) missing.push('bv_cant_pasajeros');
  if (claseId === undefined) missing.push('clase_asiento_ca_cod');

  if (missing.length) {
    return fail(res, `Campos requeridos: ${missing.join(', ')}`, 400, { missing });
  }

  const vueloParsed = parseIntParam(vueloId);
  const costoParsed = parseNumeric(costo);
  const pasajerosParsed = parseIntParam(cantidadPasajeros);
  const claseParsed = parseIntParam(claseId);
  const tasaParsed = tasaId === undefined ? null : parseIntParam(tasaId);
  const anuladoParsed = parseBoolean(res_anulado, false);

  if (vueloParsed === null || pasajerosParsed === null || claseParsed === null) {
    return fail(res, 'IDs numéricos inválidos en el cuerpo.');
  }

  if (costoParsed === null) {
    return fail(res, 'res_costo_sub_total debe ser numérico.');
  }

  if (tasaId !== undefined && tasaParsed === null) {
    return fail(res, 'tasa_cambio_tca_cod debe ser un entero válido.');
  }

  try {
    const query = `
      INSERT INTO Boleto_Vuelo (
        Compra_co_cod, Vuelo_s_cod, res_costo_sub_total, res_anulado,
        bv_cant_pasajeros, Clase_Asiento_ca_cod, Tasa_Cambio_tca_cod
      ) VALUES ($1,$2,$3,$4,$5,$6,$7)
      RETURNING *`;

    const values = [
      compraId,
      vueloParsed,
      costoParsed,
      anuladoParsed,
      pasajerosParsed,
      claseParsed,
      tasaParsed
    ];

    const result = await pool.query(query, values);
    return ok(res, result.rows[0], 'Boleto de vuelo registrado', 201);
  } catch (error) {
    return next(error);
  }
});

router.post('/compras/:compraId/boletos-viaje', async (req, res, next) => {
  const compraId = parseIntParam(req.params.compraId);
  if (compraId === null) {
    return fail(res, 'El parámetro compraId debe ser un entero válido.');
  }

  const {
    viaje_s_cod: viajeId,
    res_costo_sub_total: costo,
    res_anulado,
    bvi_cant_pasajeros: cantidadPasajeros,
    tipo_camarote_tc_cod: tipoCamaroteId,
    servicio_barco_sb_cod: servicioBarcoId,
    tasa_cambio_tca_cod: tasaId
  } = req.body ?? {};

  const missing = [];
  if (viajeId === undefined) missing.push('viaje_s_cod');
  if (costo === undefined) missing.push('res_costo_sub_total');
  if (cantidadPasajeros === undefined) missing.push('bvi_cant_pasajeros');
  if (tipoCamaroteId === undefined) missing.push('tipo_camarote_tc_cod');

  if (missing.length) {
    return fail(res, `Campos requeridos: ${missing.join(', ')}`, 400, { missing });
  }

  const viajeParsed = parseIntParam(viajeId);
  const costoParsed = parseNumeric(costo);
  const pasajerosParsed = parseIntParam(cantidadPasajeros);
  const tipoCamaroteParsed = parseIntParam(tipoCamaroteId);
  const servicioBarcoParsed = servicioBarcoId === undefined ? null : parseIntParam(servicioBarcoId);
  const tasaParsed = tasaId === undefined ? null : parseIntParam(tasaId);
  const anuladoParsed = parseBoolean(res_anulado, false);

  if (
    viajeParsed === null ||
    pasajerosParsed === null ||
    tipoCamaroteParsed === null ||
    (servicioBarcoId !== undefined && servicioBarcoParsed === null)
  ) {
    return fail(res, 'IDs numéricos inválidos en el cuerpo.');
  }

  if (costoParsed === null) {
    return fail(res, 'res_costo_sub_total debe ser numérico.');
  }

  if (tasaId !== undefined && tasaParsed === null) {
    return fail(res, 'tasa_cambio_tca_cod debe ser un entero válido.');
  }

  try {
    const query = `
      INSERT INTO Boleto_Viaje (
        Compra_co_cod, Viaje_s_cod, res_costo_sub_total, res_anulado,
        bvi_cant_pasajeros, Tipo_Camarote_tc_cod, Servicio_Barco_sb_cod, Tasa_Cambio_tca_cod
      ) VALUES ($1,$2,$3,$4,$5,$6,$7,$8)
      RETURNING *`;

    const values = [
      compraId,
      viajeParsed,
      costoParsed,
      anuladoParsed,
      pasajerosParsed,
      tipoCamaroteParsed,
      servicioBarcoParsed,
      tasaParsed
    ];

    const result = await pool.query(query, values);
    return ok(res, result.rows[0], 'Boleto de viaje registrado', 201);
  } catch (error) {
    return next(error);
  }
});

router.post('/compras/:compraId/detalle-hospedaje', async (req, res, next) => {
  const compraId = parseIntParam(req.params.compraId);
  if (compraId === null) {
    return fail(res, 'El parámetro compraId debe ser un entero válido.');
  }

  const {
    habitacion_s_cod: habitacionId,
    res_costo_sub_total: costo,
    res_anulado,
    dh_cant_noches: cantNoches,
    dh_fecha_hora_check_in: checkIn,
    dh_fecha_hora_check_out: checkOut,
    dh_fecha_hora_out_real: checkOutReal,
    tasa_cambio_tca_cod: tasaId
  } = req.body ?? {};

  const missing = [];
  if (habitacionId === undefined) missing.push('habitacion_s_cod');
  if (costo === undefined) missing.push('res_costo_sub_total');
  if (cantNoches === undefined) missing.push('dh_cant_noches');
  if (checkIn === undefined) missing.push('dh_fecha_hora_check_in');
  if (checkOut === undefined) missing.push('dh_fecha_hora_check_out');

  if (missing.length) {
    return fail(res, `Campos requeridos: ${missing.join(', ')}`, 400, { missing });
  }

  const habitacionParsed = parseIntParam(habitacionId);
  const costoParsed = parseNumeric(costo);
  const nochesParsed = parseIntParam(cantNoches);
  const checkInParsed = parseDate(checkIn);
  const checkOutParsed = parseDate(checkOut);
  const checkOutRealParsed = checkOutReal ? parseDate(checkOutReal) : null;
  const tasaParsed = tasaId === undefined ? null : parseIntParam(tasaId);
  const anuladoParsed = parseBoolean(res_anulado, false);

  if (habitacionParsed === null || nochesParsed === null) {
    return fail(res, 'IDs numéricos inválidos en el cuerpo.');
  }

  if (costoParsed === null) {
    return fail(res, 'res_costo_sub_total debe ser numérico.');
  }

  if (!checkInParsed || !checkOutParsed) {
    return fail(res, 'Las fechas de check-in y check-out deben ser válidas.');
  }

  if (checkOutReal && !checkOutRealParsed) {
    return fail(res, 'dh_fecha_hora_out_real debe ser una fecha válida.');
  }

  if (tasaId !== undefined && tasaParsed === null) {
    return fail(res, 'tasa_cambio_tca_cod debe ser un entero válido.');
  }

  try {
    const query = `
      INSERT INTO Detalle_Hospedaje (
        Compra_co_cod, Habitacion_s_cod, res_costo_sub_total, res_anulado,
        dh_cant_noches, dh_fecha_hora_check_in, dh_fecha_hora_check_out,
        dh_fecha_hora_out_real, Tasa_Cambio_tca_cod
      ) VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9)
      RETURNING *`;

    const values = [
      compraId,
      habitacionParsed,
      costoParsed,
      anuladoParsed,
      nochesParsed,
      checkInParsed,
      checkOutParsed,
      checkOutRealParsed,
      tasaParsed
    ];

    const result = await pool.query(query, values);
    return ok(res, result.rows[0], 'Detalle de hospedaje registrado', 201);
  } catch (error) {
    return next(error);
  }
});

module.exports = router;
