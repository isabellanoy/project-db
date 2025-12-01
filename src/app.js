const express = require('express');
const cors = require('cors');

const authRoutes = require('./routes/auth.routes');
const providersRoutes = require('./routes/providers.routes');
const locationsRoutes = require('./routes/locations.routes');
const servicesRoutes = require('./routes/services.routes');
const rolesRoutes = require('./routes/roles.routes');
const salesRoutes = require('./routes/sales.routes');

const app = express();

app.disable('x-powered-by');
app.use(cors());
app.use(express.json({ limit: '1mb' }));
app.use(express.urlencoded({ extended: true }));

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

app.use((err, _req, res, _next) => {
  console.error('Unhandled error:', err);
  res.status(500).json({ ok: false, message: 'Error interno en el servidor' });
});

module.exports = app;
