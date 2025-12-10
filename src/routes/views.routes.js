const express = require('express');
const path = require('path');

const router = express.Router();

// Define la ruta base: carpeta actual + src + views
const viewsRoot = path.join(process.cwd(), 'src', 'views');

// Función de ayuda para no repetir path.join a cada rato
const sendView = (res, segments) => {
  res.sendFile(path.join(viewsRoot, ...segments));
};

// --- Rutas Públicas ---

// Home -> localhost:3000/
router.get('/', (_req, res) => {
  sendView(res, ['home', 'home.html']);
});

// Auth -> localhost:3000/login
router.get('/login', (_req, res) => {
  sendView(res, ['auth', 'login.html']);
});

// --- Rutas de Usuario (Cliente) ---

// Perfil -> localhost:3000/perfil
router.get('/perfil', (_req, res) => {
  sendView(res, ['user', 'profile.html']);
});

// Mis Viajes -> localhost:3000/mis-viajes
router.get('/mis-viajes', (_req, res) => {
  sendView(res, ['user', 'my-trips.html']);
});

// --- Búsqueda ---

// Resultados -> localhost:3000/busqueda
router.get('/busqueda', (_req, res) => {
  sendView(res, ['search', 'results.html']);
});

// Detalle -> localhost:3000/detalle
router.get('/detalle', (_req, res) => {
  sendView(res, ['search', 'detail.html']);
});

// --- Reservas (Booking) ---

// Checkout -> localhost:3000/checkout
router.get('/checkout', (_req, res) => {
  sendView(res, ['booking', 'checkout.html']);
});

// Itinerario -> localhost:3000/itinerario
router.get('/itinerario', (_req, res) => {
  sendView(res, ['booking', 'itinerary.html']);
});

// --- Proveedores ---

// Inventario -> localhost:3000/inventario
router.get('/inventario', (_req, res) => {
  sendView(res, ['provider', 'inventory.html']);
});

// --- Administración ---

router.get('/admin/reportes', (_req, res) => {
  sendView(res, ['admin', 'reports.html']);
});

router.get('/admin/proveedores', (_req, res) => {
  sendView(res, ['admin', 'manage-providers.html']);
});

// Rutas para el CRUD de admin
router.get('/admin/crear', (_req, res) => {
  sendView(res, ['admin', 'crud', 'create.html']);
});

router.get('/admin/editar', (_req, res) => {
  sendView(res, ['admin', 'crud', 'edit.html']);
});

router.get('/admin/eliminar', (_req, res) => {
  sendView(res, ['admin', 'crud', 'delete.html']);
});

module.exports = router;