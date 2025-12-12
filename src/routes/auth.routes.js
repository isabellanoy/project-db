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
  return success(
    res,
    {
      method: 'POST',
      path: '/api/auth/register',
      requiredFields: [
        'username',
        'correo',
        'clave',
        'ci',
        'primer_nombre',
        'primer_apellido',
        'fecha_nacimiento',
        'sexo',
        'estado_civil'
      ],
      optionalFields: ['segundo_nombre', 'segundo_apellido'],
      hint: 'Envía el cuerpo en JSON. Ejemplo en README y /api/docs.'
    },
    'Descripción del endpoint /api/auth/register'
  );
});

// Registro de Usuario
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
    estado_civil: estadoCivil,
    direccion,
    lugar_cod: lugarCod
  } = req.body ?? {};

  const missing = [];
  if (!username) missing.push('username');
  if (!correo) missing.push('correo');
  if (!clave) missing.push('clave');
  if (!ci) missing.push('ci');
  if (!primerNombre) missing.push('primer_nombre');
  if (!primerApellido) missing.push('primer_apellido');
  if (!fechaNacimiento) missing.push('fecha_nacimiento');
  if (!sexo) missing.push('sexo');
  if (!estadoCivil) missing.push('estado_civil');
  if (!direccion) missing.push('direccion');
  if (!lugarCod) missing.push('lugar_cod');

  if (missing.length) {
    return failure(res, `Campos faltantes: ${missing.join(', ')}`, 400, { missing });
  }

  try {
    const values = [
      username,
      correo,
      clave,
      Number(ci),
      primerNombre,
      segundoNombre ?? null,
      primerApellido,
      segundoApellido ?? null,
      new Date(fechaNacimiento),
      sexo,
      estadoCivil,
      direccion,
      Number(lugarCod)
    ];

    const result = await pool.query(
      'CALL sp_registrar_cliente($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13, $14, $15, $16)', 
      [...values, null, null, null] 
    );

    
    return success(res, null, 'Cliente registrado correctamente (Verifica en BD)', 201);

  } catch (error) {
    return failure(res, error.message || 'Error en base de datos');
  }
});

// Login de Usuario
router.post('/login', async (req, res, next) => {
  const { username_o_email: usernameOrEmail, clave } = req.body ?? {};

  if (!usernameOrEmail || !clave) {
    return failure(res, 'Usuario/Email y contraseña son requeridos.');
  }

  try {
    const query = `
      DO $$
      DECLARE
        v_uid INT;
        v_user VARCHAR;
        v_msg VARCHAR;
      BEGIN
        CALL sp_login_usuario('${usernameOrEmail}', '${clave}', v_uid, v_user, v_msg);
      END $$;
    `;
    
    const userResult = await pool.query(
      `SELECT u.u_cod, u.u_username, u.u_hash_clave, r.ro_nombre
       FROM Usuario u
       INNER JOIN Rol r ON u.Rol_ro_cod = r.ro_cod
       WHERE u.u_username = $1 OR u.u_correo = $1`,
      [usernameOrEmail]
    );

    const user = userResult.rows[0];

    if (!user || user.u_hash_clave !== clave) {
      return failure(res, 'Credenciales inválidas (Validación Directa)', 401);
    }

    // Login Exitoso
    return success(res, {
      id: user.u_cod,
      username: user.u_username,
      role: user.ro_nombre
    }, 'Login exitoso');

  } catch (error) {
    return next(error);
  }
});

module.exports = router;