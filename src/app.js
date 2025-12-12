const express = require('express');
const cors = require('cors');
const path = require('path');

const authRoutes = require('./routes/auth.routes');
const providersRoutes = require('./routes/providers.routes');
const locationsRoutes = require('./routes/locations.routes');
const servicesRoutes = require('./routes/services.routes');
const rolesRoutes = require('./routes/roles.routes');
const salesRoutes = require('./routes/sales.routes');
const viewsRoutes = require('./routes/views.routes');

const app = express();

app.disable('x-powered-by');
app.use(cors());
app.use(express.json({ limit: '1mb' }));
app.use(express.urlencoded({ extended: true }));

const projectRoot = process.cwd();
const staticMappings = [
  { route: '/assets', dir: path.join(projectRoot, 'assets') },
  { route: '/src/styles', dir: path.join(projectRoot, 'src', 'styles') },
  { route: '/src/scripts', dir: path.join(projectRoot, 'src', 'scripts') },
  { route: '/src/views', dir: path.join(projectRoot, 'src', 'views') }
];

app.get('/', (_req, res) => {
  res.sendFile(path.join(projectRoot, 'index.html'));
});

staticMappings.forEach(({ route, dir }) => {
  app.use(route, express.static(dir));
});

app.use('/', viewsRoutes);

app.get('/api/health', (_req, res) => {
  res.json({ ok: true, data: { timestamp: new Date().toISOString() }, message: 'UP' });
});

const apiRoutes = [
  { basePath: '/api/auth', router: authRoutes },
  { basePath: '/api/providers', router: providersRoutes },
  { basePath: '/api/locations', router: locationsRoutes },
  { basePath: '/api/services', router: servicesRoutes },
  { basePath: '/api', router: rolesRoutes },
  { basePath: '/api', router: salesRoutes }
];

apiRoutes.forEach(({ basePath, router }) => {
  app.use(basePath, router);
});

const apiDocs = [
  { method: 'POST', path: '/api/auth/login', description: 'Valida credenciales de usuario.' },
  { method: 'POST', path: '/api/auth/register', description: 'Registra cliente, usuario y método de pago inicial.' },
  { method: 'GET', path: '/api/auth/me', description: 'Devuelve el perfil completo del cliente autenticado.' },
  { method: 'POST', path: '/api/auth/change-password', description: 'Cambia la contraseña validando la clave actual.' },
  { method: 'GET', path: '/api/providers/aerolineas', description: 'Lista todas las aerolíneas disponibles.' },
  { method: 'GET', path: '/api/providers/aerolineas/:id', description: 'Obtiene una aerolínea específica.' },
  { method: 'POST', path: '/api/providers/aerolineas', description: 'Crea una aerolínea validando lugar y fechas.' },
  { method: 'PUT', path: '/api/providers/aerolineas/:id', description: 'Actualiza una aerolínea permitiendo cambios parciales.' },
  { method: 'DELETE', path: '/api/providers/aerolineas/:id', description: 'Elimina una aerolínea si no tiene referencias activas.' },
  { method: 'GET', path: '/api/locations', description: 'Lista lugares con paginación (limit, offset).' },
  { method: 'GET', path: '/api/locations/:id/ancestros', description: 'Devuelve la jerarquía hacia arriba del lugar.' },
  { method: 'GET', path: '/api/locations/:id/descendientes', description: 'Devuelve toda la descendencia del lugar.' },
  { method: 'GET', path: '/api/locations/:id/ruta', description: 'Retorna la ruta concatenada desde la raíz.' },
  { method: 'GET', path: '/api/locations/:id/hijos', description: 'Lista los hijos directos de un lugar.' },
    { method: 'GET|POST|PUT|DELETE', path: '/api/services', description: 'CRUD dinámico del catálogo base de servicios.' },
    { method: 'GET|POST|PUT|DELETE', path: '/api/services/vuelos', description: 'CRUD dinámico de vuelos programados.' },
    { method: 'GET|POST|PUT|DELETE', path: '/api/services/viajes', description: 'CRUD dinámico de viajes/cruceros.' },
    { method: 'GET|POST|PUT|DELETE', path: '/api/services/traslados', description: 'CRUD dinámico de traslados terrestres.' },
    { method: 'GET|POST|PUT|DELETE', path: '/api/services/habitaciones', description: 'CRUD dinámico de habitaciones.' },
    { method: 'GET|POST|PUT|DELETE', path: '/api/services/servicios-adicionales', description: 'CRUD dinámico de servicios adicionales.' },
    { method: 'GET|POST|PUT|DELETE', path: '/api/services/servicios-barco', description: 'CRUD dinámico de servicios a bordo.' },
  { method: 'GET', path: '/api/roles', description: 'Lista todos los roles con su cantidad de permisos.' },
  { method: 'GET', path: '/api/roles/:id', description: 'Obtiene un rol junto a su JSON de permisos.' },
  { method: 'POST', path: '/api/roles', description: 'Crea un rol y asigna permisos opcionales.' },
  { method: 'PUT', path: '/api/roles/:id/permisos/add', description: 'Agrega permisos en lote a un rol.' },
  { method: 'PUT', path: '/api/roles/:id/permisos/remove', description: 'Quita permisos en lote a un rol.' },
  { method: 'GET', path: '/api/permisos', description: 'Lista los permisos disponibles.' },
    { method: 'GET|POST|PUT|DELETE', path: '/api/compras', description: 'CRUD genérico para compras.' },
    { method: 'GET|POST|PUT|DELETE', path: '/api/quejas', description: 'CRUD genérico para quejas.' },
    { method: 'GET|POST|PUT|DELETE', path: '/api/resenas', description: 'CRUD genérico para reseñas.' },
    { method: 'GET|POST|PUT|DELETE', path: '/api/reembolsos', description: 'CRUD genérico para reembolsos.' },
    { method: 'GET|POST|PUT|DELETE', path: '/api/pagos', description: 'CRUD para pagos con clave compuesta compra + método.' },
    { method: 'POST', path: '/api/compras/:idCompra/boletos-vuelo', description: 'Asocia boletos de vuelo a una compra.' },
    { method: 'POST', path: '/api/compras/:idCompra/boletos-viaje', description: 'Asocia boletos de viaje/crucero a una compra.' },
    { method: 'POST', path: '/api/compras/:idCompra/detalle-hospedaje', description: 'Agrega detalles de hospedaje a una compra.' }
];

app.get('/api/docs', (_req, res) => {
  res.json({ ok: true, message: 'Catálogo de rutas disponible', data: apiDocs });
});

app.use('/api', (req, res) => {
  const message = req.method === 'GET'
    ? 'Esta ruta no admite GET. Consulta /api/docs para ver los métodos disponibles.'
    : 'Ruta de API no encontrada. Verifica la URL y el método HTTP.';

  res.status(404).json({ ok: false, message, details: { method: req.method, path: req.originalUrl } });
});

app.use((err, _req, res, _next) => {
  console.error('Unhandled error:', err);
  res.status(500).json({ ok: false, message: 'Error interno en el servidor' });
});

module.exports = app;
