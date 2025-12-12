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

// Documentación de rutas
router.get('/', (_req, res) => {
  return success(res, {
    basePath: '/api/auth',
    endpoints: [
      { method: 'POST', path: '/api/auth/login', description: 'Valida credenciales de usuario.' },
      { method: 'POST', path: '/api/auth/register', description: 'Registra cliente, usuario y método de pago inicial.' },
      { method: 'GET', path: '/api/auth/me', description: 'Devuelve el perfil completo del cliente autenticado.' },
      { method: 'POST', path: '/api/auth/change-password', description: 'Cambia la contraseña validando la clave actual.' }
    ]
  }, 'Rutas de autenticación disponibles');
});

// Vista Registro
router.get('/register', (_req, res) => {
  res.sendFile(path.join(process.cwd(), 'src', 'views', 'auth', 'register.html'));
});

// Lógica Registro
router.post('/register', async (req, res, next) => {
  const {
    username, correo, clave, ci,
    primer_nombre: primerNombre, segundo_nombre: segundoNombre,
    primer_apellido: primerApellido, segundo_apellido: segundoApellido,
    fecha_nacimiento: fechaNacimiento, sexo, estado_civil: estadoCivil,
    direccion, lugar_cod: lugarCod
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
      username, correo, clave, Number(ci),
      primerNombre, segundoNombre ?? null,
      primerApellido, segundoApellido ?? null,
      new Date(fechaNacimiento), sexo, estadoCivil,
      direccion, Number(lugarCod)
    ];

    await pool.query(
      'CALL sp_registrar_cliente($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13, null, null, null)', 
      values
    );
    
    return success(res, null, 'Cliente registrado correctamente', 201);
  } catch (error) {
    return failure(res, error.message || 'Error en base de datos');
  }
});

// Vista Login
router.get('/login', (_req, res) => {
  res.sendFile(path.join(process.cwd(), 'src', 'views', 'auth', 'login.html'));
});

// Lógica Login
router.post('/login', async (req, res, next) => {
  const { username_o_email: usernameOrEmail, clave } = req.body ?? {};

  if (!usernameOrEmail || !clave) {
    return failure(res, 'Usuario/Email y contraseña son requeridos.');
  }

  try {
    const userResult = await pool.query(
      `SELECT u.u_cod, u.u_username, u.u_hash_clave, r.ro_nombre
       FROM Usuario u
       INNER JOIN Rol r ON u.Rol_ro_cod = r.ro_cod
       WHERE u.u_username = $1 OR u.u_correo = $1`,
      [usernameOrEmail]
    );

    const user = userResult.rows[0];

    if (!user || user.u_hash_clave !== clave) {
      return failure(res, 'Credenciales inválidas', 401);
    }

    return success(res, {
      id: user.u_cod,
      username: user.u_username,
      role: user.ro_nombre
    }, 'Login exitoso');

  } catch (error) {
    return next(error);
  }
});

// --- PERFIL DE USUARIO ---
router.get('/me', async (req, res) => {
  const userId = parseUserId(req); // Usa req.query.usuario_cod o headers

  if (!userId) {
    return failure(res, 'Falta el parámetro usuario_cod');
  }

  try {
    const query = `
      SELECT 
        c.c_p_nombre, c.c_s_nombre, c.c_p_apellido, c.c_s_apellido,
        c.c_ci, c.c_direccion, u.u_correo,
        COALESCE(mp.m_cant_acumulada, 0) as millas
      FROM Usuario u
      JOIN Cliente c ON u.Cliente_c_cod = c.c_cod
      LEFT JOIN Metodo_Pago mp ON c.c_cod = mp.m_Cliente_cod AND mp.mp_tipo = 'MILLA'
      WHERE u.u_cod = $1
    `;

    const result = await pool.query(query, [userId]);
    const user = result.rows[0];

    if (!user) {
      return failure(res, 'Usuario no encontrado', 404);
    }

    const nombreCompleto = `${user.c_p_nombre} ${user.c_p_apellido}`;

    return success(res, {
      nombre: nombreCompleto,
      nombre_corto: user.c_p_nombre,
      correo: user.u_correo,
      ci: user.c_ci,
      direccion: user.c_direccion,
      millas: user.millas
    }, 'Perfil obtenido');

  } catch (error) {
    console.error(error);
    return failure(res, 'Error al obtener perfil');
  }
});

// Cambio de contraseña
router.post('/change-password', async (req, res, next) => {
  const userId = parseUserId(req);
  const { clave_actual: claveActual, clave_nueva: claveNueva } = req.body ?? {};

  if (!userId || !claveActual || !claveNueva) {
    return failure(res, 'Datos incompletos.');
  }

  try {
    await pool.query('CALL sp_cambiar_clave_usuario($1,$2,$3, null)', [
      userId, claveActual, claveNueva
    ]);
    return success(res, null, 'Clave actualizada correctamente');
  } catch (error) {
    return failure(res, error.message);
  }
});

module.exports = router;