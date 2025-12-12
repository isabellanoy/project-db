const express = require('express');
const { generateCrud } = require('../utils/crudGenerator');

const router = express.Router();

const serviceMappings = [
  { path: '/vuelos', table: 'Vuelo', idField: 's_cod' },
  { path: '/viajes', table: 'Viaje', idField: 's_cod' },
  { path: '/traslados', table: 'Traslado', idField: 's_cod' },
  { path: '/habitaciones', table: 'Habitacion', idField: 's_cod' },
  { path: '/servicios-adicionales', table: 'Servicio_Adicional', idField: 's_cod' },
  { path: '/servicios-barco', table: 'Servicio_Barco', idField: 'sb_cod' }
];

serviceMappings.forEach(({ path, table, idField }) => {
  router.use(path, generateCrud(table, idField));
});

router.use('/', generateCrud('Servicio', 's_cod'));

module.exports = router;
