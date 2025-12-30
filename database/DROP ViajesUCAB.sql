
-- Tablas de transacciones y detalles
DROP TABLE IF EXISTS Pago_Cuota CASCADE;
DROP TABLE IF EXISTS Pago CASCADE;
DROP TABLE IF EXISTS Cuota CASCADE;
DROP TABLE IF EXISTS Nota_Credito CASCADE;
DROP TABLE IF EXISTS Reembolso CASCADE;
DROP TABLE IF EXISTS Metodo_Pago CASCADE;

-- Tablas de reservas y boletos
DROP TABLE IF EXISTS Resena CASCADE;
DROP TABLE IF EXISTS Queja CASCADE;
DROP TABLE IF EXISTS Via_Res CASCADE;
DROP TABLE IF EXISTS Res_Pro_Ser CASCADE;
DROP TABLE IF EXISTS Boleto_Vuelo CASCADE;
DROP TABLE IF EXISTS Boleto_Viaje CASCADE;
DROP TABLE IF EXISTS Detalle_Hospedaje CASCADE;
DROP TABLE IF EXISTS Detalle_Traslado CASCADE;
DROP TABLE IF EXISTS Entrada_Digital CASCADE;

-- Tablas de compras
DROP TABLE IF EXISTS Compra CASCADE;

-- Tablas relacionales de servicios y productos
DROP TABLE IF EXISTS Pro_Ser CASCADE;
DROP TABLE IF EXISTS Paq_Ser CASCADE;
DROP TABLE IF EXISTS Eti_Ser CASCADE;
DROP TABLE IF EXISTS Eti_Paq CASCADE;
DROP TABLE IF EXISTS Eti_Cli CASCADE;
DROP TABLE IF EXISTS Deseo_Servicio CASCADE;
DROP TABLE IF EXISTS Deseo_Paquete CASCADE;
DROP TABLE IF EXISTS Bar_Ser CASCADE;
DROP TABLE IF EXISTS Rol_Per CASCADE;

-- Tablas de servicios
DROP TABLE IF EXISTS Paquete_Turistico CASCADE;
DROP TABLE IF EXISTS Traslado CASCADE;
DROP TABLE IF EXISTS Viaje CASCADE;
DROP TABLE IF EXISTS Vuelo CASCADE;
DROP TABLE IF EXISTS Habitacion CASCADE;
DROP TABLE IF EXISTS Servicio_Adicional CASCADE;
DROP TABLE IF EXISTS Servicio_Barco CASCADE;
DROP TABLE IF EXISTS Bar_Tip CASCADE;
DROP TABLE IF EXISTS Aer_Cla CASCADE;
DROP TABLE IF EXISTS Servicio CASCADE;

-- Tablas de documentos y auditoría
DROP TABLE IF EXISTS Documento CASCADE;
DROP TABLE IF EXISTS Auditoria CASCADE;
DROP TABLE IF EXISTS Usuario CASCADE;

-- Tablas de promotores y ofertas
DROP TABLE IF EXISTS Promocion CASCADE;
DROP TABLE IF EXISTS Etiqueta CASCADE;

-- Tablas de recursos de medios de transporte
DROP TABLE IF EXISTS Automovil CASCADE;
DROP TABLE IF EXISTS Barco CASCADE;
DROP TABLE IF EXISTS Aeronave CASCADE;
DROP TABLE IF EXISTS Aer_Cla CASCADE;
DROP TABLE IF EXISTS Modelo CASCADE;
DROP TABLE IF EXISTS Marca CASCADE;

-- Tablas de información de medios y tipos
DROP TABLE IF EXISTS Tipo_Habitacion CASCADE;
DROP TABLE IF EXISTS Clase_Asiento CASCADE;
DROP TABLE IF EXISTS Tipo_Camarote CASCADE;
DROP TABLE IF EXISTS Tipo_Comida CASCADE;
DROP TABLE IF EXISTS Tipo_Documento CASCADE;
DROP TABLE IF EXISTS Restriccion_Paquete CASCADE;
DROP TABLE IF EXISTS Ambiente CASCADE;
DROP TABLE IF EXISTS Permiso CASCADE;
DROP TABLE IF EXISTS Rol CASCADE;

-- Tablas de transacciones y cambios
DROP TABLE IF EXISTS Tas_Lug CASCADE;
DROP TABLE IF EXISTS Tasa_Cambio CASCADE;

-- Tablas de proveedores y socios
DROP TABLE IF EXISTS Terminal_Operacion CASCADE;
DROP TABLE IF EXISTS Restaurante CASCADE;
DROP TABLE IF EXISTS Viajero CASCADE;
DROP TABLE IF EXISTS Telefono CASCADE;
DROP TABLE IF EXISTS Banco CASCADE;

-- Tablas base de personas
DROP TABLE IF EXISTS Cliente CASCADE;
DROP TABLE IF EXISTS Empleado CASCADE;

-- Tablas de proveedores
DROP TABLE IF EXISTS Hotel CASCADE;
DROP TABLE IF EXISTS Barco CASCADE;
DROP TABLE IF EXISTS Aeronave CASCADE;
DROP TABLE IF EXISTS Aerolinea CASCADE;
DROP TABLE IF EXISTS Crucero CASCADE;
DROP TABLE IF EXISTS Operador_Turistico CASCADE;
DROP TABLE IF EXISTS Transporte_Terrestre CASCADE;

-- Tabla base de geografía
DROP TABLE IF EXISTS Lugar CASCADE;

-- Procedimientos y funciones
DROP FUNCTION IF EXISTS fn_actualizar_promocion;
DROP FUNCTION IF EXISTS fn_agregar_servicios_promocion;
DROP FUNCTION IF EXISTS fn_buscar_aerolinea_por_nombre;
DROP FUNCTION IF EXISTS fn_buscar_aerolineas;
DROP FUNCTION IF EXISTS fn_buscar_hijos_lugar;
DROP FUNCTION IF EXISTS fn_buscar_lugar_por_nombre;
DROP FUNCTION IF EXISTS fn_buscar_lugares;
DROP FUNCTION IF EXISTS fn_cliente_existe_por_ci;
DROP FUNCTION IF EXISTS fn_eliminar_promocion;
DROP FUNCTION IF EXISTS fn_email_existe;
DROP FUNCTION IF EXISTS fn_existe_lugar;
DROP FUNCTION IF EXISTS fn_listar_promociones;
DROP FUNCTION IF EXISTS fn_obtener_promocion;
DROP FUNCTION IF EXISTS fn_obtener_tipo_proveedor_servicio;
DROP FUNCTION IF EXISTS fn_quitar_servicios_promocion;
DROP FUNCTION IF EXISTS fn_registrar_promocion;
DROP FUNCTION IF EXISTS fn_username_existe;
DROP FUNCTION IF EXISTS fn_validar_permiso_usuario;
DROP FUNCTION IF EXISTS fn_validar_proveedor_servicio;
DROP FUNCTION IF EXISTS fn_actualizar_nombre_rol;
DROP FUNCTION IF EXISTS fn_agregar_permisos_a_rol;
DROP FUNCTION IF EXISTS fn_crear_rol_con_permisos;
DROP FUNCTION IF EXISTS fn_listar_permisos_disponibles;
DROP FUNCTION IF EXISTS fn_listar_restricciones_paquete;
DROP FUNCTION IF EXISTS fn_listar_todos_roles;
DROP FUNCTION IF EXISTS fn_obtener_rol_con_permisos;
DROP FUNCTION IF EXISTS fn_quitar_permisos_de_rol;
DROP FUNCTION IF EXISTS fn_rol_tiene_permiso;
DROP FUNCTION IF EXISTS fn_listar_vuelos;
DROP FUNCTION IF EXISTS fn_listar_viajes;
DROP FUNCTION IF EXISTS fn_listar_traslados;
DROP FUNCTION IF EXISTS fn_listar_servicios_adicionales;
DROP FUNCTION IF EXISTS fn_listar_habitaciones;
DROP FUNCTION IF EXISTS fn_obtener_paquete_por_id;
DROP FUNCTION IF EXISTS fn_listar_paquetes_turisticos;
DROP FUNCTION IF EXISTS fn_obtener_servicios_paquete;
DROP FUNCTION IF EXISTS fn_obtener_compra_activa;
DROP FUNCTION IF EXISTS fn_crear_compra_itinerario;
DROP FUNCTION IF EXISTS fn_buscar_promocion_servicio;
DROP FUNCTION IF EXISTS fn_agregar_entrada_digital_a_compra;
DROP FUNCTION IF EXISTS fn_agregar_habitacion_a_compra;
DROP FUNCTION IF EXISTS fn_agregar_traslado_a_compra;
DROP FUNCTION IF EXISTS fn_agregar_vuelo_a_compra;
DROP FUNCTION IF EXISTS fn_agregar_viaje_a_compra;
DROP FUNCTION IF EXISTS fn_cancelar_compra;
DROP FUNCTION IF EXISTS fn_calcular_millas_compra;
DROP FUNCTION IF EXISTS fn_validar_montos;
DROP FUNCTION IF EXISTS fn_pago_tarjeta;
DROP FUNCTION IF EXISTS fn_pago_cheque;
DROP FUNCTION IF EXISTS fn_pago_deposito;
DROP FUNCTION IF EXISTS fn_pago_operacion_digital;
DROP FUNCTION IF EXISTS fn_pago_cripto;
DROP FUNCTION IF EXISTS fn_pagar_paquete;
DROP FUNCTION IF EXISTS fn_procesar_a_pago;
DROP FUNCTION IF EXISTS fn_obtener_tasa_actual;
DROP FUNCTION IF EXISTS fn_crear_compra_paquete;
DROP FUNCTION IF EXISTS fn_reporte_ranking_proveedores;
DROP FUNCTION IF EXISTS fn_reporte_impacto_financiero_millas;
DROP FUNCTION IF EXISTS fn_auditoria_reembolsos;
DROP FUNCTION IF EXISTS fn_paquetes_canjeados;
DROP FUNCTION IF EXISTS fn_reporte_millas_por_destino;
DROP FUNCTION IF EXISTS fn_eliminar_viajero;
DROP FUNCTION IF EXISTS fn_agregar_viajero;
DROP FUNCTION IF EXISTS fn_pago_millas;
DROP FUNCTION IF EXISTS fn_listar_clases_asiento_vuelo;
DROP FUNCTION IF EXISTS fn_listar_tipos_camarote_viaje;
DROP FUNCTION IF EXISTS fn_listar_servicios_viaje;
DROP FUNCTION IF EXISTS fn_listar_vehiculos_traslado;
DROP FUNCTION IF EXISTS fn_obtener_monto_restante;
DROP FUNCTION IF EXISTS fn_generar_factura;
DROP FUNCTION IF EXISTS fn_agregar_servicio_deseo;
DROP FUNCTION IF EXISTS fn_agregar_paquete_deseo;
DROP FUNCTION IF EXISTS fn_eliminar_servicio_deseo;
DROP FUNCTION IF EXISTS fn_eliminar_paquete_deseo;
DROP FUNCTION IF EXISTS fn_ver_deseos_paquetes;
DROP FUNCTION IF EXISTS fn_ver_deseos_servicios;

DROP PROCEDURE IF EXISTS sp_actualizar_aerolinea;
DROP PROCEDURE IF EXISTS sp_cambiar_clave_usuario;
DROP PROCEDURE IF EXISTS sp_crear_paquete_turistico;
DROP PROCEDURE IF EXISTS sp_crear_aerolinea;
DROP PROCEDURE IF EXISTS sp_eliminar_aerolinea;
DROP PROCEDURE IF EXISTS sp_login_usuario;
DROP PROCEDURE IF EXISTS sp_obtener_aerolinea_por_id;
DROP PROCEDURE IF EXISTS sp_obtener_cliente_por_usuario;
DROP PROCEDURE IF EXISTS sp_registrar_cliente;
DROP PROCEDURE IF EXISTS sp_actualizar_paquete_turistico;
DROP PROCEDURE IF EXISTS sp_eliminar_paquete_turistico;
DROP PROCEDURE IF EXISTS sp_agregar_servicios_paquete;
DROP PROCEDURE IF EXISTS sp_quitar_servicios_paquete;
DROP PROCEDURE IF EXISTS sp_validar_pagos;
DROP PROCEDURE IF EXISTS sp_crear_cuotas_pago;
DROP PROCEDURE IF EXISTS sp_agregar_servicios_paquete_a_compra;

-- Triggers
DROP FUNCTION IF EXISTS fn_crear_pago_millas;
DROP TRIGGER IF EXISTS tr_nuevo_cliente_millas ON Cliente;

DROP FUNCTION IF EXISTS fn_generar_nota_credito;
DROP TRIGGER IF EXISTS trg_crear_nota_credito_post_reembolso ON Reembolso;