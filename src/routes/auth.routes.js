const express = require('express');
const path = require('path');
const pool = require('../config/db');

const router = express.Router();

const success = (res, data = null, message = 'OK', status = 200) =>
  res.status(status).json({ ok: true, data, message });

const failure = (res, message = 'Error', status = 400, data = null) =>
  res.status(status).json({ ok: false, data, message });

const parseUserId = (req) => {
  const candidate = req.query.usuario_cod ?? req.headers['x-user-id'] ?? req.body?.usuario_cod;
  if (candidate === undefined || candidate === null || candidate === '') return null;
  const parsed = Number(candidate);
  return Number.isNaN(parsed) ? null : parsed;
};

router.get('/', (_req, res) => {
  return success(res, {
    basePath: '/api/auth',
    endpoints: [
      { method: 'POST', path: '/api/auth/login', description: 'Valida credenciales de usuario.' },
      { method: 'POST', path: '/api/auth/register', description: 'Registra cliente, usuario y método de pago inicial.' },
      { method: 'GET', path: '/api/auth/me', description: 'Devuelve el perfil completo del cliente autenticado.' },
      { method: 'POST', path: '/api/auth/change-password', description: 'Cambia la contraseña validando la clave actual.' }
    ],
    hint: 'Usa el método HTTP indicado para cada ruta. Las rutas POST esperan JSON en el cuerpo.'
  }, 'Rutas de autenticación disponibles');
});

router.get('/register', (_req, res) => {
  res.sendFile(path.join(process.cwd(), 'src', 'views', 'register.html'));
});

router.post('/register', async (req, res, next) => {
  const {
    username,
    correo,
    clave,
    ci,
    primer_nombre: primerNombre,
    segundo_nombre: segundoNombre,
    primer_apellido: primerApellido,
    segundo_apellido: segundoApellido,
    fecha_nacimiento: fechaNacimiento,
    sexo,
    estado_civil: estadoCivil
  } = req.body ?? {};

  const missing = [];
  if (!username) missing.push('username');
  if (!correo) missing.push('correo');
  if (!clave) missing.push('clave');
  if (ci === undefined || ci === null) missing.push('ci');
  if (!primerNombre) missing.push('primer_nombre');
  if (!primerApellido) missing.push('primer_apellido');
  if (!fechaNacimiento) missing.push('fecha_nacimiento');
  if (!sexo) missing.push('sexo');
  if (!estadoCivil) missing.push('estado_civil');

  if (missing.length) {
    return failure(res, `Campos requeridos faltantes: ${missing.join(', ')}`, 400, { missing });
  }

  const fechaNacimientoDate = new Date(fechaNacimiento);
  if (Number.isNaN(fechaNacimientoDate.getTime())) {
    return failure(res, 'fecha_nacimiento no tiene un formato válido (usa ISO-8601).');
  }

  const ciInt = Number(ci);
  if (!Number.isInteger(ciInt)) {
    return failure(res, 'ci debe ser un número entero.');
  }

  try {
    const values = [
      username,
      correo,
      clave,
      ciInt,
      primerNombre,
      segundoNombre ?? null,
      primerApellido,
      segundoApellido ?? null,
      fechaNacimientoDate,
      sexo,
      estadoCivil
    ];

    const result = await pool.query('CALL sp_registrar_cliente($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11)', values);
    const payload = result?.rows?.[0] ?? {};
    const isError = typeof payload.p_mensaje === 'string' && payload.p_mensaje.toUpperCase().startsWith('ERROR');

    if (isError) {
      return failure(res, payload.p_mensaje, 400, payload);
    }

    return success(res, payload, payload.p_mensaje || 'Cliente registrado', 201);
  } catch (error) {
    return next(error);
  }
});

router.get('/login', (_req, res) => {
  res.sendFile(path.join(process.cwd(), 'src', 'views', 'login.html'));
});

router.post('/login', async (req, res, next) => {
  const { username_o_email: usernameOrEmail, clave } = req.body ?? {};

  if (!usernameOrEmail || !clave) {
    return failure(res, 'username_o_email y clave son requeridos.');
  }

  try {
    const result = await pool.query('CALL sp_login_usuario($1,$2)', [usernameOrEmail, clave]);
    const payload = result?.rows?.[0] ?? {};
    const isError = typeof payload.p_mensaje === 'string' && payload.p_mensaje.toUpperCase().startsWith('ERROR');

    if (isError) {
      return failure(res, payload.p_mensaje, 401, payload);
    }

    return success(res, payload, payload.p_mensaje || 'Login exitoso');
  } catch (error) {
    return next(error);
  }
});

router.get('/me', async (req, res, next) => {
  const userId = parseUserId(req);
  if (userId === null) {
    return failure(res, 'Debe proporcionar usuario_cod (query), header X-User-Id o en el cuerpo de la petición.');
  }

  try {
    const result = await pool.query('CALL sp_obtener_cliente_por_usuario($1)', [userId]);
    const payload = result?.rows?.[0] ?? {};

    if (!payload.p_cliente_cod) {
      return failure(res, 'Cliente no encontrado', 404);
    }

    return success(res, payload, 'Perfil obtenido');
  } catch (error) {
    return next(error);
  }
});

router.get('/change-password', (_req, res) => {
  return success(
    res,
    {
      method: 'POST',
      path: '/api/auth/change-password',
      requiredFields: ['usuario_cod', 'clave_actual', 'clave_nueva'],
      hint: 'Envía el identificador de usuario por query, header X-User-Id o en el cuerpo.'
    },
    'Descripción del endpoint /api/auth/change-password'
  );
});

router.post('/change-password', async (req, res, next) => {
  const userId = parseUserId(req);
  const { clave_actual: claveActual, clave_nueva: claveNueva } = req.body ?? {};

  if (userId === null || !claveActual || !claveNueva) {
    return failure(res, 'usuario_cod, clave_actual y clave_nueva son requeridos.');
  }

  if (claveActual === claveNueva) {
    return failure(res, 'La nueva clave debe ser diferente a la actual.');
  }

  try {
    const result = await pool.query('CALL sp_cambiar_clave_usuario($1,$2,$3)', [
      userId,
      claveActual,
      claveNueva
    ]);
    const payload = result?.rows?.[0] ?? {};
    const isError = typeof payload.p_mensaje === 'string' && payload.p_mensaje.toUpperCase().startsWith('ERROR');

    if (isError) {
      return failure(res, payload.p_mensaje, 400, payload);
    }

    return success(res, payload, payload.p_mensaje || 'Clave actualizada');
  } catch (error) {
    return next(error);
  }
});

module.exports = router;
