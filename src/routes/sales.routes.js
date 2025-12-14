const express = require('express');
const pool = require('../config/db');
const { generateCrud } = require('../utils/crudGenerator');

const router = express.Router();

const ok = (res, data = null, message = 'OK', status = 200) =>
  res.status(status).json({ ok: true, data, message });

const fail = (res, message = 'Error', status = 400, data = null) =>
  res.status(status).json({ ok: false, data, message });

// =====================================================================
// RUTAS TRANSACCIONALES (AGREGAR AL CARRITO / ITINERARIO)
// Llaman a las funciones SQL (Store Procedures) para validar y calcular.
// =====================================================================

// 1. Agregar Vuelo
router.post('/add/vuelo', async (req, res) => {
  const { usuario_id, vuelo_id, pasajeros, clase_id } = req.body;

  if (!usuario_id || !vuelo_id || !pasajeros || !clase_id) {
    return fail(res, 'Faltan datos obligatorios (usuario_id, vuelo_id, pasajeros, clase_id)');
  }

  try {
    const p_cod_usuario = parseInt(usuario_id, 10);
    const p_id_vuelo = parseInt(vuelo_id, 10);
    const p_cant_pasajeros = parseInt(pasajeros, 10);
    const p_id_clase_asiento = parseInt(clase_id, 10);

    if (isNaN(p_cod_usuario) || isNaN(p_id_vuelo) || isNaN(p_cant_pasajeros) || isNaN(p_id_clase_asiento)) {
      return fail(res, 'Los IDs y la cantidad de pasajeros deben ser números válidos.');
    }

    // Llama a fn_agregar_vuelo_a_compra(usuario, vuelo, pax, clase)
    const result = await pool.query(
      'SELECT fn_agregar_vuelo_a_compra($1, $2, $3, $4) as exito',
      [p_cod_usuario, p_id_vuelo, p_cant_pasajeros, p_id_clase_asiento]
    );

    if (result.rows[0].exito) {
      return ok(res, null, 'Vuelo agregado al itinerario exitosamente');
    } else {
      return fail(res, 'No se pudo agregar el vuelo (Verifica disponibilidad o estado de compra)');
    }
  } catch (error) {
    return fail(res, error.message || 'Error al agregar vuelo');
  }
});

// 2. Agregar Alojamiento (Hotel)
router.post('/add/alojamiento', async (req, res) => {
  const { usuario_id, habitacion_id, noches, check_in } = req.body;

  if (!usuario_id || !habitacion_id || !noches || !check_in) {
    return fail(res, 'Faltan datos (usuario_id, habitacion_id, noches, check_in)');
  }

  try {
    const result = await pool.query(
      'SELECT fn_agregar_habitacion_a_compra($1, $2, $3, $4) as exito',
      [usuario_id, habitacion_id, noches, check_in]
    );

    if (result.rows[0].exito) return ok(res, null, 'Alojamiento agregado exitosamente');
    return fail(res, 'No se pudo agregar el alojamiento');
  } catch (error) {
    return fail(res, error.message);
  }
});

// 3. Agregar Crucero (Viaje)
router.post('/add/viaje', async (req, res) => {
  // El servicio de barco es opcional
  const { usuario_id, viaje_id, pasajeros, camarote_id, servicio_barco_sb_cod } = req.body;

  if (!usuario_id || !viaje_id || !pasajeros || !camarote_id) {
    return fail(res, 'Faltan datos requeridos (usuario_id, viaje_id, pasajeros, camarote_id)');
  }

  try {
    const p_usuario_id = parseInt(usuario_id, 10);
    const p_viaje_id = parseInt(viaje_id, 10);
    const p_pasajeros = parseInt(pasajeros, 10);
    const p_camarote_id = parseInt(camarote_id, 10);
    
    // servicio_barco_sb_cod es opcional, puede ser NaN si no se envía
    const p_servicio_barco_id = servicio_barco_sb_cod ? parseInt(servicio_barco_sb_cod, 10) : null;

    if (isNaN(p_usuario_id) || isNaN(p_viaje_id) || isNaN(p_pasajeros) || isNaN(p_camarote_id) || (p_servicio_barco_id !== null && isNaN(p_servicio_barco_id))) {
      return fail(res, 'Los IDs y la cantidad de pasajeros deben ser números válidos.');
    }

    const result = await pool.query(
      'SELECT fn_agregar_viaje_a_compra($1, $2, $3, $4, $5) as exito',
      [p_usuario_id, p_viaje_id, p_pasajeros, p_camarote_id, p_servicio_barco_id]
    );

    if (result.rows[0].exito) return ok(res, null, 'Crucero agregado exitosamente');
    return fail(res, 'No se pudo agregar el crucero');
  } catch (error) {
    return fail(res, error.message);
  }
});

// 4. Agregar Traslado
router.post('/add/traslado', async (req, res) => {
  const { usuario_id, traslado_id, automovil_id, fecha } = req.body;

  if (!usuario_id || !traslado_id || !automovil_id || !fecha) {
    return fail(res, 'Faltan datos requeridos (usuario_id, traslado_id, automovil_id, fecha)');
  }

  try {
    const p_usuario_id = parseInt(usuario_id, 10);
    const p_traslado_id = parseInt(traslado_id, 10);
    const p_automovil_id = parseInt(automovil_id, 10);

    if (isNaN(p_usuario_id) || isNaN(p_traslado_id) || isNaN(p_automovil_id)) {
      return fail(res, 'Los IDs deben ser números válidos.');
    }

    const result = await pool.query(
      'SELECT fn_agregar_traslado_a_compra($1, $2, $3, $4) as exito',
      [p_usuario_id, p_traslado_id, p_automovil_id, fecha]
    );

    if (result.rows[0].exito) return ok(res, null, 'Traslado agregado exitosamente');
    return fail(res, 'No se pudo agregar el traslado');
  } catch (error) {
    return fail(res, error.message);
  }
});

// 5. Agregar Actividad (Entrada Digital)
router.post('/add/actividad', async (req, res) => {
  const { usuario_id, actividad_id, personas } = req.body;

  if (!usuario_id || !actividad_id || !personas) {
    return fail(res, 'Faltan datos (usuario_id, actividad_id, personas)');
  }

  try {
    const p_usuario_id = parseInt(usuario_id, 10);
    const p_actividad_id = parseInt(actividad_id, 10);
    const p_personas = parseInt(personas, 10);

    if (isNaN(p_usuario_id) || isNaN(p_actividad_id) || isNaN(p_personas)) {
      return fail(res, 'Los IDs y la cantidad de personas deben ser números válidos.');
    }

    const result = await pool.query(
      'SELECT fn_agregar_entrada_digital_a_compra($1, $2, $3) as exito',
      [p_usuario_id, p_actividad_id, p_personas]
    );

    if (result.rows[0].exito) return ok(res, null, 'Actividad agregada exitosamente');
    return fail(res, 'No se pudo agregar la actividad');
  } catch (error) {
    return fail(res, error.message);
  }
});

// 6. Comprar Paquete Turístico
router.post('/add/paquete', async (req, res) => {
  const { usuario_id, paquete_id } = req.body;

  if (!usuario_id || !paquete_id) return fail(res, 'Faltan datos (usuario_id, paquete_id)');

  try {
    // Llama a fn_crear_compra_paquete del SQL
    const result = await pool.query(
      'SELECT fn_crear_compra_paquete($1, $2) as exito',
      [usuario_id, paquete_id]
    );

    if (result.rows[0].exito) {
      return ok(res, null, 'Paquete reservado exitosamente. Vaya a pagar con sus Millas.');
    } else {
      return fail(res, 'No se pudo reservar. Verifique que no tenga otra compra activa.');
    }
  } catch (error) {
    return fail(res, error.message);
  }
});

// 7. Cancelar Compra Activa
router.post('/cancel', async (req, res) => {
  const { usuario_id } = req.body;

  if (!usuario_id) {
    return fail(res, 'Falta usuario_id');
  }

  try {
    const p_usuario_id = parseInt(usuario_id, 10);
    if (isNaN(p_usuario_id)) {
      return fail(res, 'El usuario_id debe ser un número válido.');
    }

    const result = await pool.query(
      'SELECT fn_cancelar_compra($1) as exito',
      [p_usuario_id]
    );

    if (result.rows[0].exito) {
      return ok(res, null, 'Compra cancelada exitosamente');
    } else {
      return fail(res, 'No se pudo cancelar la compra (posiblemente no hay una compra activa).');
    }
  } catch (error) {
    return fail(res, error.message);
  }
});

// --- CONSULTAR ITINERARIO (CARRITO ACTIVO) ---
router.get('/itinerary', async (req, res) => {
  const userId = req.query.usuario_id;

  if (!userId) return fail(res, 'Falta usuario_id');

  try {
    const p_usuario_id = parseInt(userId, 10);
    if (isNaN(p_usuario_id)) {
      return fail(res, 'El usuario_id debe ser un número válido.');
    }

    // Obtener el cliente_c_cod a partir del u_cod del usuario
    const clienteRes = await pool.query('SELECT cliente_c_cod FROM Usuario WHERE u_cod = $1', [p_usuario_id]);
    if (clienteRes.rows.length === 0) {
      return fail(res, 'Usuario no encontrado. Asegúrese de que el usuario esté asociado a un cliente.');
    }
    const clienteId = clienteRes.rows[0].cliente_c_cod;

    // 1. Obtener ID de la compra activa con el cliente_c_cod
    const compraRes = await pool.query('SELECT fn_obtener_compra_activa($1) as id', [clienteId]);
    const compraId = compraRes.rows[0].id;

    if (!compraId) {
      return ok(res, { empty: true, items: [] }, 'No hay itinerario activo');
    }

    // 2. Obtener detalles de la compra (Monto total, estado, etc.)
    const infoCompra = await pool.query('SELECT * FROM Compra WHERE co_cod = $1', [compraId]);

    // 3. Obtener cada tipo de servicio asociado a esa compra
    // Usamos Promise.all para hacer las consultas en paralelo y ser más rápidos
    const [vuelos, hoteles, cruceros, traslados, actividades] = await Promise.all([
      // Vuelos
      pool.query(`
        SELECT bv.*, v.v_cod_vue, s.s_costo as precio_base, 
               l_orig.l_nombre as origen, l_dest.l_nombre as destino
        FROM Boleto_Vuelo bv
        JOIN Vuelo v ON bv.Vuelo_s_cod = v.s_cod
        JOIN Servicio s ON v.s_cod = s.s_cod
        JOIN Lugar l_orig ON v.Lugar_l_cod = l_orig.l_cod
        JOIN Lugar l_dest ON v.Lugar_l_cod2 = l_dest.l_cod
        WHERE bv.Compra_co_cod = $1 AND bv.res_anulado = FALSE`, [compraId]),
      
      // Hoteles
      pool.query(`
        SELECT dh.*, h.p_nombre as nombre_hotel, s.s_costo as precio_base
        FROM Detalle_Hospedaje dh
        JOIN Habitacion hab ON dh.Habitacion_s_cod = hab.s_cod
        JOIN Hotel h ON hab.Hotel_p_cod = h.p_cod
        JOIN Servicio s ON hab.s_cod = s.s_cod
        WHERE dh.Compra_co_cod = $1 AND dh.res_anulado = FALSE`, [compraId]),

      // Cruceros
      pool.query(`
        SELECT bvi.*, b.b_nombre as barco, s.s_costo as precio_base
        FROM Boleto_Viaje bvi
        JOIN Viaje vi ON bvi.Viaje_s_cod = vi.s_cod
        JOIN Barco b ON vi.Barco_mt_cod = b.mt_cod
        JOIN Servicio s ON vi.s_cod = s.s_cod
        WHERE bvi.Compra_co_cod = $1 AND bvi.res_anulado = FALSE`, [compraId]),

      // Traslados
      pool.query(`
        SELECT dt.*, l.l_nombre as destino, s.s_costo as precio_base
        FROM Detalle_Traslado dt
        JOIN Traslado t ON dt.Traslado_s_cod = t.s_cod
        JOIN Lugar l ON t.Lugar_l_cod = l.l_cod
        JOIN Servicio s ON t.s_cod = s.s_cod
        WHERE dt.Compra_co_cod = $1 AND dt.res_anulado = FALSE`, [compraId]),

      // Actividades
      pool.query(`
        SELECT ed.*, sa.sa_nombre as nombre_actividad, s.s_costo as precio_base
        FROM Entrada_Digital ed
        JOIN Servicio_Adicional sa ON ed.Servicio_Adicional_s_cod = sa.s_cod
        JOIN Servicio s ON sa.s_cod = s.s_cod
        WHERE ed.Compra_co_cod = $1 AND ed.res_anulado = FALSE`, [compraId])
    ]);

    // 4. Armar respuesta consolidada
    const itinerario = {
      compra_id: compraId,
      info: infoCompra.rows[0],
      items: [
        ...vuelos.rows.map(i => ({ type: 'vuelo', ...i })),
        ...hoteles.rows.map(i => ({ type: 'hotel', ...i })),
        ...cruceros.rows.map(i => ({ type: 'crucero', ...i })),
        ...traslados.rows.map(i => ({ type: 'traslado', ...i })),
        ...actividades.rows.map(i => ({ type: 'actividad', ...i }))
      ]
    };

    return ok(res, itinerario, 'Itinerario obtenido');

  } catch (error) {
    console.error(error);
    return fail(res, error.message || 'Error al obtener itinerario');
  }
});

// =====================================================================
// RUTAS DE PAGO (CHECKOUT)
// =====================================================================

// 1. Iniciar Proceso de Pago (Congela el monto y cambia estado a PAGANDO)
router.post('/checkout/init', async (req, res) => {
  const { usuario_id, financiado, cuotas, huella_carbono } = req.body;

  if (!usuario_id) return fail(res, 'Falta usuario_id');

  try {
    // Llama a fn_procesar_a_pago(usuario, es_financiado, cuotas, monto_huella)
    const result = await pool.query(
      'SELECT fn_procesar_a_pago($1, $2, $3, $4) as exito',
      [usuario_id, financiado || false, cuotas || 1, huella_carbono || 0]
    );

    if (result.rows[0].exito) {
      return ok(res, null, 'Compra procesada a estado PAGANDO. Proceda a registrar los pagos.');
    } else {
      return fail(res, 'No se pudo iniciar el pago. Verifique el estado de su compra.');
    }
  } catch (error) {
    return fail(res, error.message);
  }
});

// 2. Pagar con Tarjeta
router.post('/checkout/pay/card', async (req, res) => {
  const { 
    usuario_id, monto, numero, cvc, titular, vencimiento, banco_id, emisor 
  } = req.body;

  try {
    // fn_pago_tarjeta(usuario, monto, numero, cvc, titular, vencimiento, banco, emisor)
    const result = await pool.query(
      'SELECT fn_pago_tarjeta($1, $2, $3, $4, $5, $6, $7, $8) as exito',
      [usuario_id, monto, numero, cvc, titular, vencimiento, banco_id, emisor]
    );

    if (result.rows[0].exito) return ok(res, null, 'Pago con tarjeta registrado exitosamente');
    return fail(res, 'Error al registrar el pago con tarjeta');
  } catch (error) {
    return fail(res, error.message);
  }
});

// 3. Pagar con Operación Digital (Zelle, Pago Móvil)
router.post('/checkout/pay/digital', async (req, res) => {
  const { usuario_id, monto, referencia } = req.body;

  try {
    // fn_pago_operacion_digital(usuario, monto, referencia)
    const result = await pool.query(
      'SELECT fn_pago_operacion_digital($1, $2, $3) as exito',
      [usuario_id, monto, referencia]
    );

    if (result.rows[0].exito) return ok(res, null, 'Pago digital registrado exitosamente');
    return fail(res, 'Error al registrar el pago digital');
  } catch (error) {
    return fail(res, error.message);
  }
});

// 4. Pagar con Millas
router.post('/checkout/pay/miles', async (req, res) => {
  const { usuario_id, cantidad_millas } = req.body;

  try {
    // fn_pago_millas(usuario, cantidad)
    const result = await pool.query(
      'SELECT fn_pago_millas($1, $2) as exito',
      [usuario_id, cantidad_millas]
    );

    if (result.rows[0].exito) return ok(res, null, 'Pago con millas registrado');
    return fail(res, 'Fondos insuficientes o error al canjear millas');
  } catch (error) {
    return fail(res, error.message);
  }
});

// --- HISTORIAL DE VIAJES ---
router.get('/history', async (req, res) => {
  const userId = req.query.usuario_id;

  if (!userId) return fail(res, 'Falta usuario_id');

  try {
    // 1. Buscamos las compras FINALIZADAS, CANCELADAS o FINANCIADAS
    // Hacemos el JOIN con Usuario para traducir el u_cod a c_cod
    const query = `
      SELECT 
        co.co_cod, 
        co.co_fecha_hora, 
        co.co_monto_total, 
        co.co_estado, 
        co.co_millas_a_agregar,
        co.co_es_paquete,
        pt.pt_nombre as nombre_paquete
      FROM Compra co
      JOIN Cliente c ON co.Cliente_c_cod = c.c_cod
      JOIN Usuario u ON u.Cliente_c_cod = c.c_cod
      LEFT JOIN Paquete_Turistico pt ON co.Paquete_Turistico_pt_cod = pt.pt_cod
      WHERE u.u_cod = $1
        AND co.co_estado IN ('FINALIZADO', 'CANCELADO', 'FINANCIADO', 'PAGANDO')
      ORDER BY co.co_fecha_hora DESC
    `;

    const result = await pool.query(query, [userId]);

    return ok(res, result.rows, 'Historial obtenido');
  } catch (error) {
    console.error(error);
    return fail(res, error.message);
  }
});

// =====================================================================
// RUTAS CRUD (ADMINISTRACIÓN Y CONSULTAS BÁSICAS)
// =====================================================================

const crudMappings = [
  { path: '/compras', table: 'Compra', idField: 'co_cod' },
  { path: '/pagos', table: 'Pago', idField: 'compra_co_cod' }, 
  { path: '/quejas', table: 'Queja', idField: 'q_cod' },
  { path: '/resenas', table: 'Resena', idField: 'r_cod' },
  { path: '/reembolsos', table: 'Reembolso', idField: 'ree_cod' }
];

crudMappings.forEach(({ path, table, idField }) => {
  router.use(path, generateCrud(table, idField));
});

module.exports = router;