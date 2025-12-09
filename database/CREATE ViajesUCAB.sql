-- ===================================================
-- CREATE - TABLAS
-- ===================================================

CREATE TABLE Aer_Cla (
    ac_cant_asientos INT NOT NULL,
    Aeronave_mt_cod INT NOT NULL,
    Clase_Asiento_ca_cod INT NOT NULL
);

ALTER TABLE Aer_Cla ADD CONSTRAINT Aer_Cla_PK PRIMARY KEY (Aeronave_mt_cod, Clase_Asiento_ca_cod);

COMMENT ON COLUMN Aer_Cla.ac_cant_asientos IS 'Cantidad de asientos disponibles en esa clase';

CREATE TABLE Aerolinea (
    p_cod SERIAL NOT NULL,
	p_nombre VARCHAR(50) NOT NULL,
	p_fecha_afiliacion DATE NOT NULL,
    a_fecha_constitucion DATE NOT NULL,
    Lugar_l_cod INT NOT NULL
);

ALTER TABLE Aerolinea ADD CONSTRAINT Aerolinea_PK PRIMARY KEY (p_cod);
ALTER SEQUENCE aerolinea_p_cod_seq RESTART WITH 1; 

COMMENT ON COLUMN Aerolinea.p_cod IS 'Identificacion del proveedor';
COMMENT ON COLUMN Aerolinea.a_fecha_constitucion IS 'Fecha de constitucion de la aerolinea';

CREATE TABLE Aeronave (
    mt_cod SERIAL NOT NULL,
	mt_capacidad INT NOT NULL,
    Aerolinea_p_cod INT NOT NULL,
	Modelo_mv_cod INT NOT NULL
);

ALTER TABLE Aeronave ADD CONSTRAINT Aeronave_PK PRIMARY KEY (mt_cod);
ALTER SEQUENCE aeronave_mt_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Aeronave.mt_cod IS 'Identificador del medio de transporte';

CREATE TABLE Ambiente (
    am_cod SERIAL NOT NULL,
    am_nombre VARCHAR(50) NOT NULL
);

ALTER TABLE Ambiente ADD CONSTRAINT Ambiente_PK PRIMARY KEY (am_cod);
ALTER SEQUENCE ambiente_am_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Ambiente.am_cod IS 'Identificador del ambiente';
COMMENT ON COLUMN Ambiente.am_nombre IS 'Nombre del ambiente';

CREATE TABLE Auditoria (
    a_cod SERIAL NOT NULL,
    a_tipo_accion_realizada VARCHAR(10) NOT NULL,
    a_fecha_hora TIMESTAMP NOT NULL,
    a_descripcion VARCHAR(1000) NOT NULL,
	a_tabla_afectada VARCHAR(100) NOT NULL,
    Usuario_u_cod INT NOT NULL
);

ALTER TABLE Auditoria ADD CONSTRAINT Auditoria_PK PRIMARY KEY (a_cod);
ALTER SEQUENCE auditoria_a_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Auditoria.a_cod IS 'identificacion del registro de auditoria';
COMMENT ON COLUMN Auditoria.a_tipo_accion_realizada IS 'Accion CRUD realizada';
COMMENT ON COLUMN Auditoria.a_fecha_hora IS 'Hora y fecha de la accion';
COMMENT ON COLUMN Auditoria.a_descripcion IS 'Descripcion completa de la accion realizada';

CREATE TABLE Automovil (
    mt_cod SERIAL NOT NULL,
	mt_capacidad INT NOT NULL,
    a_placa VARCHAR(20) NOT NULL UNIQUE,
    a_costo_por_km NUMERIC(10,2) NOT NULL,
    Transporte_Terrestre_p_cod INT NOT NULL,
	Modelo_mv_cod INT NOT NULL
);

ALTER TABLE Automovil ADD CONSTRAINT Automovil_PK PRIMARY KEY (mt_cod);
ALTER SEQUENCE automovil_mt_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Automovil.mt_cod IS 'Identificador del medio de transporte';
COMMENT ON COLUMN Automovil.a_placa IS 'Placa / Matricula del vehiculo';
COMMENT ON COLUMN Automovil.a_costo_por_km IS 'Costo por km recorrido del vehiculo';

CREATE TABLE Banco (
    ba_cod SERIAL NOT NULL,
    ba_nombre VARCHAR(50) NOT NULL
);

ALTER TABLE Banco ADD CONSTRAINT Banco_PK PRIMARY KEY (ba_cod);
ALTER SEQUENCE banco_ba_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Banco.ba_cod IS 'Identificador del banco';
COMMENT ON COLUMN Banco.ba_nombre IS 'Nombre del banco';

CREATE TABLE Barco (
    mt_cod SERIAL NOT NULL,
	mt_capacidad INT NOT NULL,
    b_nombre VARCHAR(50) NOT NULL,
    Crucero_p_cod INT NOT NULL,
	Modelo_mv_cod INT NOT NULL
);

ALTER TABLE Barco ADD CONSTRAINT Barco_PK PRIMARY KEY (mt_cod);
ALTER SEQUENCE barco_mt_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Barco.mt_cod IS 'Identificador del medio de transporte';
COMMENT ON COLUMN Barco.b_nombre IS 'Nombre del barco';

CREATE TABLE Bar_Ser (
    Servicio_Barco_sb_cod INT NOT NULL,
    Barco_mt_cod INT NOT NULL
);

ALTER TABLE Bar_Ser ADD CONSTRAINT Bar_Ser_PK PRIMARY KEY (Servicio_Barco_sb_cod, Barco_mt_cod);

CREATE TABLE Bar_Tip (
    bt_cant_camarotes INT NOT NULL,
    Barco_mt_cod INT NOT NULL,
    Tipo_Camarote_tc_cod INT NOT NULL
);

ALTER TABLE Bar_Tip ADD CONSTRAINT Bar_Tip_PK PRIMARY KEY (Barco_mt_cod, Tipo_Camarote_tc_cod);

COMMENT ON COLUMN Bar_Tip.bt_cant_camarotes IS 'Cantidad de camarotes disponibles para un tipo en particular';

CREATE TABLE Boleto_Viaje (
    Viaje_s_cod INT NOT NULL,
    Compra_co_cod INT NOT NULL,
	res_costo_sub_total NUMERIC(12,2) NOT NULL,
	res_anulado BOOLEAN,
    bvi_cant_pasajeros INT NOT NULL,
    Tipo_Camarote_tc_cod INT NOT NULL,
    Servicio_Barco_sb_cod INT,
	Tasa_Cambio_tca_cod INT
);

ALTER TABLE Boleto_Viaje ADD CONSTRAINT Boleto_Viaje_PK PRIMARY KEY (Compra_co_cod, Viaje_s_cod);

COMMENT ON COLUMN Boleto_Viaje.bvi_cant_pasajeros IS 'Cantidad de pasajeros para el crucero';

CREATE TABLE Boleto_Vuelo (
    Compra_co_cod INT NOT NULL,
	Vuelo_s_cod INT NOT NULL,
	res_costo_sub_total NUMERIC(12,2) NOT NULL,
	res_anulado BOOLEAN,
	bv_cant_pasajeros INT NOT NULL,
    Clase_Asiento_ca_cod INT NOT NULL,
	Tasa_Cambio_tca_cod INT
);

ALTER TABLE Boleto_Vuelo ADD CONSTRAINT Boleto_Vuelo_PK PRIMARY KEY (Compra_co_cod, Vuelo_s_cod);

COMMENT ON COLUMN Boleto_Vuelo.bv_cant_pasajeros IS 'Cantidad de pasajeros para el vuelo';

CREATE TABLE Clase_Asiento (
    ca_cod SERIAL NOT NULL,
    ca_nombre VARCHAR(50) NOT NULL,
    ca_descripcion VARCHAR(100) NOT NULL,
    ca_costo NUMERIC(10,2) NOT NULL
);

ALTER TABLE Clase_Asiento ADD CONSTRAINT Clase_Asiento_PK PRIMARY KEY (ca_cod);
ALTER SEQUENCE clase_asiento_ca_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Clase_Asiento.ca_cod IS 'Identificador de la clase';
COMMENT ON COLUMN Clase_Asiento.ca_nombre IS 'Nombre de la clase de asiento';
COMMENT ON COLUMN Clase_Asiento.ca_descripcion IS 'Detalles sobre la clase de asiento';
COMMENT ON COLUMN Clase_Asiento.ca_costo IS 'Costo sobre la clase de asiento';

CREATE TABLE Cliente (
    c_cod SERIAL NOT NULL,
    c_CI INT UNIQUE NOT NULL,
    c_p_nombre VARCHAR(50) NOT NULL,
    c_s_nombre VARCHAR(50),
    c_p_apellido VARCHAR(50) NOT NULL,
    c_s_apellido VARCHAR(50),
    c_fecha_nacimiento DATE NOT NULL,
    c_sexo CHAR(1) NOT NULL,
    c_edo_civil VARCHAR(10) NOT NULL,
	c_direccion VARCHAR(100) NOT NULL,
	Lugar_l_cod INT NOT NULL
);

ALTER TABLE Cliente ADD CONSTRAINT Cliente_PK PRIMARY KEY (c_cod);
ALTER SEQUENCE cliente_c_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Cliente.c_cod IS 'identificacion empleado';
COMMENT ON COLUMN Cliente.c_p_nombre IS 'Primer nombre';
COMMENT ON COLUMN Cliente.c_s_nombre IS 'Segundo nombre';
COMMENT ON COLUMN Cliente.c_p_apellido IS 'Primer apellido';
COMMENT ON COLUMN Cliente.c_s_apellido IS 'Segundo apellido';
COMMENT ON COLUMN Cliente.c_fecha_nacimiento IS 'Fecha de nacimiento del empleado';
COMMENT ON COLUMN Cliente.c_sexo IS 'Sexo del cliente';
COMMENT ON COLUMN Cliente.c_edo_civil IS 'Estado civil del cliente';

CREATE TABLE Compra (
    co_cod SERIAL NOT NULL,
    co_fecha_hora TIMESTAMP NOT NULL,
    co_monto_total NUMERIC(15,2) NOT NULL,
    co_millas_a_agregar INT NOT NULL,
    co_compensacion_huella NUMERIC(12,2),
	co_estado VARCHAR(20) NOT NULL,
	co_es_paquete BOOLEAN,
	Paquete_Turistico_pt_cod INT,
    Cliente_c_cod INT NOT NULL
);

ALTER TABLE Compra ADD CONSTRAINT Compra_PK PRIMARY KEY (co_cod);
ALTER SEQUENCE compra_co_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Compra.co_cod IS 'Identificacion de la compra';
COMMENT ON COLUMN Compra.co_fecha_hora IS 'Fecha y hora de la compra';
COMMENT ON COLUMN Compra.co_monto_total IS 'Monto total de la compra';
COMMENT ON COLUMN Compra.co_millas_a_agregar IS 'Millas a agregar al cliente';
COMMENT ON COLUMN Compra.co_compensacion_huella IS 'Monto adicional para la compensacion de la huella de carbono';

CREATE TABLE Crucero (
    p_cod SERIAL NOT NULL,
	p_nombre VARCHAR(50) NOT NULL,
	p_fecha_afiliacion DATE NOT NULL,
    c_fecha_constitucion DATE NOT NULL,
    Lugar_l_cod INT NOT NULL
);

ALTER TABLE Crucero ADD CONSTRAINT Crucero_PK PRIMARY KEY (p_cod);
ALTER SEQUENCE crucero_p_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Crucero.p_cod IS 'Identificacion del proveedor';
COMMENT ON COLUMN Crucero.c_fecha_constitucion IS 'Fecha de constitucion de la empresa';

CREATE TABLE Cuota (
    cu_cod SERIAL NOT NULL,
    cu_monto NUMERIC(10,2) NOT NULL,
    cu_fecha_hora_final TIMESTAMP NOT NULL,
    cu_recargo_adicional NUMERIC(10,2),
    Compra_co_cod INT NOT NULL
);

ALTER TABLE Cuota ADD CONSTRAINT Cuota_PK PRIMARY KEY (cu_cod);
ALTER SEQUENCE cuota_cu_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Cuota.cu_cod IS 'Identificacion de la cuota';
COMMENT ON COLUMN Cuota.cu_monto IS 'Monto de la cuota';
COMMENT ON COLUMN Cuota.cu_fecha_hora_final IS 'Fecha y hora final antes de retraso';
COMMENT ON COLUMN Cuota.cu_recargo_adicional IS 'Monto adicional sobre la cuota si no se cancela antes';

CREATE TABLE Deseo_Paquete (
    Paquete_Turistico_pt_cod INT NOT NULL,
    Cliente_c_cod INT NOT NULL
);

ALTER TABLE Deseo_Paquete ADD CONSTRAINT Deseo_Paquete_PK PRIMARY KEY (Paquete_Turistico_pt_cod, Cliente_c_cod);

CREATE TABLE Deseo_Servicio (
    Servicio_s_cod INT NOT NULL,
    Cliente_c_cod INT NOT NULL
);

ALTER TABLE Deseo_Servicio ADD CONSTRAINT Deseo_Servicio_PK PRIMARY KEY (Servicio_s_cod, Cliente_c_cod);

CREATE TABLE Detalle_Hospedaje (
    Compra_co_cod INT NOT NULL,
    Habitacion_s_cod INT NOT NULL,
	res_costo_sub_total NUMERIC(12,2) NOT NULL,
	res_anulado BOOLEAN,
    dh_cant_noches INT NOT NULL,
    dh_fecha_hora_check_in TIMESTAMP NOT NULL,
	dh_fecha_hora_check_out TIMESTAMP NOT NULL,
	dh_fecha_hora_out_real TIMESTAMP,
	Tasa_Cambio_tca_cod INT
);

ALTER TABLE Detalle_Hospedaje ADD CONSTRAINT Detalle_Hospedaje_PK PRIMARY KEY (Compra_co_cod, Habitacion_s_cod);

COMMENT ON COLUMN Detalle_Hospedaje.dh_cant_noches IS 'Cantidad de noches a quedarse';
COMMENT ON COLUMN Detalle_Hospedaje.dh_fecha_hora_check_in IS 'Fecha y hora de ingreso';

CREATE TABLE Detalle_Traslado (
    Compra_co_cod INT NOT NULL,
    Traslado_s_cod INT NOT NULL,
	res_costo_sub_total NUMERIC(12,2) NOT NULL,
	res_anulado BOOLEAN,
    dt_fecha_hora TIMESTAMP NOT NULL,
    Automovil_mt_cod INT NOT NULL,
	Tasa_Cambio_tca_cod INT
);

ALTER TABLE Detalle_Traslado ADD CONSTRAINT Detalle_Traslado_PK PRIMARY KEY (Compra_co_cod, Traslado_s_cod);

COMMENT ON COLUMN Detalle_Traslado.dt_fecha_hora IS 'Fecha y hora del traslado seleccionado';

CREATE TABLE Documento (
    do_cod SERIAL NOT NULL,
    do_descripcion VARCHAR(100) NOT NULL,
    do_nombre_archivo VARCHAR(100) NOT NULL,
    Tipo_Documento_td_cod INT NOT NULL,
    Cliente_c_cod INT NOT NULL
);

ALTER TABLE Documento ADD CONSTRAINT Documento_PK PRIMARY KEY (do_cod);
ALTER SEQUENCE documento_do_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Documento.do_cod IS 'identificacion del documento';
COMMENT ON COLUMN Documento.do_descripcion IS 'Descripcion sobre el documento';
COMMENT ON COLUMN Documento.do_nombre_archivo IS 'Nombre del archivo con la imagen del doc';

CREATE TABLE Empleado (
    e_cod SERIAL NOT NULL,
    e_CI INT UNIQUE NOT NULL,
    e_p_nombre VARCHAR(50) NOT NULL,
    e_s_nombre VARCHAR(50),
    e_p_apellido VARCHAR(50) NOT NULL,
    e_s_apellido VARCHAR(50),
    e_fecha_nacimiento DATE NOT NULL
);

ALTER TABLE Empleado ADD CONSTRAINT Empleado_PK PRIMARY KEY (e_cod);
ALTER SEQUENCE empleado_e_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Empleado.e_cod IS 'identificacion empleado';
COMMENT ON COLUMN Empleado.e_p_nombre IS 'Primer nombre';
COMMENT ON COLUMN Empleado.e_s_nombre IS 'Segundo nombre';
COMMENT ON COLUMN Empleado.e_p_apellido IS 'Primer apellido';
COMMENT ON COLUMN Empleado.e_s_apellido IS 'Segundo apellido';
COMMENT ON COLUMN Empleado.e_fecha_nacimiento IS 'Fecha de nacimiento del empleado';

CREATE TABLE Entrada_Digital (
    Servicio_Adicional_s_cod INT NOT NULL,
    Compra_co_cod INT NOT NULL,
	res_costo_sub_total NUMERIC(12,2) NOT NULL,
	res_anulado BOOLEAN,
    ed_cant_personas INT NOT NULL,
	Tasa_Cambio_tca_cod INT
);

ALTER TABLE Entrada_Digital ADD CONSTRAINT Entrada_Digital_PK PRIMARY KEY (Compra_co_cod, Servicio_Adicional_s_cod);

COMMENT ON COLUMN Entrada_Digital.ed_cant_personas IS 'Cantidad de personas a asistir a la actividad turistica';

CREATE TABLE Eti_Cli (
    Cliente_c_cod INT NOT NULL,
    Etiqueta_et_cod INT NOT NULL
);

ALTER TABLE Eti_Cli ADD CONSTRAINT Eti_Cli_PK PRIMARY KEY (Cliente_c_cod, Etiqueta_et_cod);

CREATE TABLE Eti_Paq (
    Etiqueta_et_cod INT NOT NULL,
    Paquete_Turistico_pt_cod INT NOT NULL
);

ALTER TABLE Eti_Paq ADD CONSTRAINT Eti_Paq_PK PRIMARY KEY (Etiqueta_et_cod, Paquete_Turistico_pt_cod);

CREATE TABLE Etiqueta (
    et_cod SERIAL NOT NULL,
    et_nombre VARCHAR(50) NOT NULL
);

ALTER TABLE Etiqueta ADD CONSTRAINT Etiqueta_PK PRIMARY KEY (et_cod);
ALTER SEQUENCE etiqueta_et_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Etiqueta.et_cod IS 'Identificador de la etiqueta';
COMMENT ON COLUMN Etiqueta.et_nombre IS 'Nombre de la etiqueta';

CREATE TABLE Eti_Ser (
    Etiqueta_et_cod INT NOT NULL,
    Servicio_s_cod INT NOT NULL
);

ALTER TABLE Eti_Ser ADD CONSTRAINT Eti_Ser_PK PRIMARY KEY (Etiqueta_et_cod, Servicio_s_cod);

CREATE TABLE Habitacion (
    s_cod INT NOT NULL,
    ha_numero VARCHAR(10) NOT NULL,
    ha_capacidad INT NOT NULL,
    Hotel_p_cod INT NOT NULL,
    Tipo_Habitacion_th_cod INT NOT NULL
);

ALTER TABLE Habitacion ADD CONSTRAINT Habitacion_PK PRIMARY KEY (s_cod);

COMMENT ON COLUMN Habitacion.s_cod IS 'Identificador del servicio';
COMMENT ON COLUMN Habitacion.ha_numero IS 'Numero de la habitacion en el hotel';
COMMENT ON COLUMN Habitacion.ha_capacidad IS 'Capacidad de personas para la habitacion';

CREATE TABLE Hotel (
    p_cod SERIAL NOT NULL,
	p_nombre VARCHAR(50) NOT NULL,
	p_fecha_afiliacion DATE NOT NULL,
    h_direccion VARCHAR(50) NOT NULL,
    Lugar_l_cod INT NOT NULL
);

ALTER TABLE Hotel ADD CONSTRAINT Hotel_PK PRIMARY KEY (p_cod);
ALTER SEQUENCE hotel_p_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Hotel.p_cod IS 'Identificacion del proveedor';
COMMENT ON COLUMN Hotel.h_direccion IS 'Referencia a su ubicacion';

CREATE TABLE Lugar (
    l_cod SERIAL NOT NULL,
    l_nombre VARCHAR(50) NOT NULL,
    l_tipo VARCHAR(50) NOT NULL,
    Lugar_l_cod INT
);

ALTER TABLE Lugar ADD CONSTRAINT Lugar_PK PRIMARY KEY (l_cod);
ALTER SEQUENCE lugar_l_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Lugar.l_cod IS 'Identificacion del lugar';
COMMENT ON COLUMN Lugar.l_nombre IS 'Nombre del lugar';
COMMENT ON COLUMN Lugar.l_tipo IS 'Componente geografico al que pertenece';

CREATE TABLE Marca (
    mav_cod SERIAL NOT NULL,
    mav_nombre VARCHAR(50) NOT NULL,
    mav_tipo_vehiculo VARCHAR(50) NOT NULL
);

ALTER TABLE Marca ADD CONSTRAINT Marca_PK PRIMARY KEY (mav_cod);
ALTER SEQUENCE marca_mav_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Marca.mav_cod IS 'Identificador de la marca de vehiculos';
COMMENT ON COLUMN Marca.mav_nombre IS 'Nombre de la marca';

CREATE TABLE Metodo_Pago (
    mp_cod SERIAL NOT NULL,
    Cliente_c_cod INT NOT NULL,
	t_numero BIGINT,
	t_cod_seguridad INT,
	t_nombre_titular VARCHAR(50),
	t_fecha_vencimiento DATE,
	t_Banco_cod INT,
	t_emisor VARCHAR(50),
	c_codigo_cuenta BIGINT,
	c_numero BIGINT,
	c_nombre_titular VARCHAR(50),
	c_fecha_emision DATE,
	c_Banco_cod INT,
	de_num_referencia BIGINT UNIQUE,
	de_num_destino BIGINT,
	de_Banco_cod INT,
	od_num_referencia BIGINT UNIQUE,
	u_hash_id VARCHAR(100) UNIQUE,
	u_direccion_billetera VARCHAR(100),
	m_cant_acumulada BIGINT,
	m_Cliente_cod INT,
	mp_tipo VARCHAR(50) NOT NULL
);

ALTER TABLE Metodo_Pago ADD CONSTRAINT Metodo_Pago_PK PRIMARY KEY (mp_cod);
ALTER SEQUENCE metodo_pago_mp_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Metodo_Pago.mp_cod IS 'Identificacion del metodo de pago';

CREATE TABLE Modelo (
    mv_cod SERIAL NOT NULL,
    mv_nombre VARCHAR(50) NOT NULL,
    Marca_mav_cod INT NOT NULL
);

ALTER TABLE Modelo ADD CONSTRAINT Modelo_PK PRIMARY KEY (mv_cod);
ALTER SEQUENCE modelo_mv_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Modelo.mv_cod IS 'Identificador del modelo del vehiculo';
COMMENT ON COLUMN Modelo.mv_nombre IS 'Nombre del modelo';

CREATE TABLE Nota_Credito (
    nc_cod SERIAL NOT NULL,
    nc_monto_devuelto NUMERIC(12,2) NOT NULL,
    Reembolso_ree_cod INT NOT NULL,
	Metodo_Pago_mp_cod INT NOT NULL
);

ALTER TABLE Nota_Credito ADD CONSTRAINT Nota_Credito_PK PRIMARY KEY (nc_cod);
ALTER SEQUENCE nota_credito_nc_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Nota_Credito.nc_cod IS 'Identificador de la Nota de Credito';
COMMENT ON COLUMN Nota_Credito.nc_monto_devuelto IS 'Monto de devolucion (90%)';

CREATE TABLE Operador_Turistico (
    p_cod SERIAL NOT NULL,
	p_nombre VARCHAR(50) NOT NULL,
	p_fecha_afiliacion DATE NOT NULL,
    Lugar_l_cod INT NOT NULL
);

ALTER TABLE Operador_Turistico ADD CONSTRAINT Operador_Turistico_PK PRIMARY KEY (p_cod);
ALTER SEQUENCE operador_turistico_p_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Operador_Turistico.p_cod IS 'Identificacion del proveedor';

CREATE TABLE Pago (
    pa_monto NUMERIC(12,2) NOT NULL,
    pa_fecha_hora TIMESTAMP NOT NULL,
    Compra_co_cod INT NOT NULL,
    Metodo_Pago_mp_cod INT NOT NULL
);

ALTER TABLE Pago ADD CONSTRAINT Pago_PK PRIMARY KEY (Compra_co_cod, Metodo_Pago_mp_cod);

COMMENT ON COLUMN Pago.pa_monto IS 'Monto del pago realizado';
COMMENT ON COLUMN Pago.pa_fecha_hora IS 'Fecha y hora del pago';

CREATE TABLE Pago_Cuota (
    pc_monto NUMERIC(12,2) NOT NULL,
    pc_fecha_hora TIMESTAMP NOT NULL,
    Cuota_cu_cod INT NOT NULL,
    Metodo_Pago_mp_cod INT NOT NULL
);

ALTER TABLE Pago_Cuota ADD CONSTRAINT Pago_Cuota_PK PRIMARY KEY (Cuota_cu_cod, Metodo_Pago_mp_cod);

COMMENT ON COLUMN Pago_Cuota.pc_monto IS 'Monto del pago realizado';
COMMENT ON COLUMN Pago_Cuota.pc_fecha_hora IS 'Fecha y hora del pago';

CREATE TABLE Paq_Ser (
    Paquete_Turistico_pt_cod INT NOT NULL,
    Servicio_s_cod INT NOT NULL
);

ALTER TABLE Paq_Ser ADD CONSTRAINT Paq_Ser_PK PRIMARY KEY (Paquete_Turistico_pt_cod, Servicio_s_cod);

CREATE TABLE Paquete_Turistico (
    pt_cod SERIAL NOT NULL,
    pt_cant_personas INTEGER NOT NULL,
    pt_nombre VARCHAR(50) NOT NULL,
    pt_descripcion VARCHAR(200) NOT NULL,
    pt_costo NUMERIC(12,2) NOT NULL,
    pt_costo_millas INT NOT NULL,
    Restriccion_Paquete_rp_cod INT
);

ALTER TABLE Paquete_Turistico ADD CONSTRAINT Paquete_Turistico_PK PRIMARY KEY (pt_cod);
ALTER SEQUENCE paquete_turistico_pt_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Paquete_Turistico.pt_cod IS 'Identificador del paquete';
COMMENT ON COLUMN Paquete_Turistico.pt_cant_personas IS 'Capacidad de personas del paquete (por cliente)';
COMMENT ON COLUMN Paquete_Turistico.pt_nombre IS 'Nombre del paquete turistico';
COMMENT ON COLUMN Paquete_Turistico.pt_descripcion IS 'Detalles sobre el contenido del paquete';
COMMENT ON COLUMN Paquete_Turistico.pt_costo IS 'Costo total del paquete';
COMMENT ON COLUMN Paquete_Turistico.pt_costo_millas IS 'Costo en millas para clientes fieles';

CREATE TABLE Permiso (
    pe_cod SERIAL NOT NULL,
    pe_nombre VARCHAR(50) NOT NULL,
    pe_tipo VARCHAR(10) NOT NULL
);

ALTER TABLE Permiso ADD CONSTRAINT Permiso_PK PRIMARY KEY (pe_cod);
ALTER SEQUENCE permiso_pe_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Permiso.pe_cod IS 'identificacion permiso';
COMMENT ON COLUMN Permiso.pe_nombre IS 'nombre otorgado al permiso';
COMMENT ON COLUMN Permiso.pe_tipo IS 'tipo de permiso';

CREATE TABLE Promocion (
    pr_cod SERIAL NOT NULL,
    pr_nombre VARCHAR(50) NOT NULL,
    pr_porcentaje NUMERIC(2) NOT NULL,
    Aerolinea_p_cod INT,
	Transporte_Terrestre_p_cod INT,
	Crucero_p_cod INT,
	Operador_Turistico_p_cod INT,
	Hotel_p_cod INT
);

ALTER TABLE Promocion ADD CONSTRAINT Promocion_PK PRIMARY KEY (pr_cod);
ALTER SEQUENCE promocion_pr_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Promocion.pr_cod IS 'Identificador de la promocion';
COMMENT ON COLUMN Promocion.pr_nombre IS 'Nombre otorgado a la promocion';
COMMENT ON COLUMN Promocion.pr_porcentaje IS 'Porcentaje a aplicar al servicio';

CREATE TABLE Pro_Ser (
    ps_monto NUMERIC(12,2) NOT NULL,
    Promocion_pr_cod INT NOT NULL,
    Servicio_s_cod INT NOT NULL
);

ALTER TABLE Pro_Ser ADD CONSTRAINT Pro_Ser_PK PRIMARY KEY (Promocion_pr_cod, Servicio_s_cod);

COMMENT ON COLUMN Pro_Ser.ps_monto IS 'Costo sobre la promocion aplicado el descuento';

CREATE TABLE Queja (
    q_cod SERIAL NOT NULL,
    q_descripcion VARCHAR(200) NOT NULL,
    q_resuelta BOOLEAN,
	Empleado_e_cod INT NOT NULL,
	Boleto_Vuelo_co_cod INT,
	Boleto_Vuelo_s_cod INT,
	Detalle_Traslado_co_cod INT,
	Detalle_Traslado_s_cod INT,
	Boleto_Viaje_co_cod INT,
	Boleto_Viaje_s_cod INT,
	Entrada_Digital_co_cod INT,
	Entrada_Digital_s_cod INT,
	Detalle_Hospedaje_co_cod INT,
	Detalle_Hospedaje_s_cod INT	
);

ALTER TABLE Queja ADD CONSTRAINT Queja_PK PRIMARY KEY (q_cod);
ALTER SEQUENCE queja_q_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Queja.q_cod IS 'Identificador de la queja';
COMMENT ON COLUMN Queja.q_descripcion IS 'Descripcion del inconveniente del cliente sobre la reserva';
COMMENT ON COLUMN Queja.q_resuelta IS 'Para dterminar si está o no resuelta la queja';

CREATE TABLE Reembolso (
    ree_cod SERIAL NOT NULL,
	ree_razon VARCHAR(200) NOT NULL,
    ree_fecha_hora TIMESTAMP NOT NULL,
	Boleto_Vuelo_co_cod INT,
	Boleto_Vuelo_s_cod INT,
	Detalle_Traslado_co_cod INT,
	Detalle_Traslado_s_cod INT,
	Boleto_Viaje_co_cod INT,
	Boleto_Viaje_s_cod INT,
	Entrada_Digital_co_cod INT,
	Entrada_Digital_s_cod INT,
	Detalle_Hospedaje_co_cod INT,
	Detalle_Hospedaje_s_cod INT
);

ALTER TABLE Reembolso ADD CONSTRAINT Reembolso_PK PRIMARY KEY (ree_cod);
ALTER SEQUENCE reembolso_ree_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Reembolso.ree_cod IS 'Identificador del reembolso';
COMMENT ON COLUMN Reembolso.ree_fecha_hora IS 'Fecha y hora de la solicitud del reembolso';

CREATE TABLE Resena (
    r_cod SERIAL NOT NULL,
    r_calificacion NUMERIC(2) NOT NULL,
    r_comentario VARCHAR(200) NOT NULL,
	Boleto_Vuelo_co_cod INT,
	Boleto_Vuelo_s_cod INT,
	Detalle_Traslado_co_cod INT,
	Detalle_Traslado_s_cod INT,
	Boleto_Viaje_co_cod INT,
	Boleto_Viaje_s_cod INT,
	Entrada_Digital_co_cod INT,
	Entrada_Digital_s_cod INT,
	Detalle_Hospedaje_co_cod INT,
	Detalle_Hospedaje_s_cod INT	
);

ALTER TABLE Resena ADD CONSTRAINT Resena_PK PRIMARY KEY (r_cod);
ALTER SEQUENCE resena_r_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Resena.r_cod IS 'Identificador de la reseña';
COMMENT ON COLUMN Resena.r_calificacion IS 'Calificacion colocada sobre la reserva';
COMMENT ON COLUMN Resena.r_comentario IS 'El comentario del cliente sobre la reserva';

CREATE TABLE Res_Pro_Ser (
	Pro_Ser_Promocion_pr_cod INT NOT NULL,
    Pro_Ser_Servicio_s_cod INT NOT NULL,
	Boleto_Vuelo_co_cod INT,
	Boleto_Vuelo_s_cod INT,
	Detalle_Traslado_co_cod INT,
	Detalle_Traslado_s_cod INT,
	Boleto_Viaje_co_cod INT,
	Boleto_Viaje_s_cod INT,
	Entrada_Digital_co_cod INT,
	Entrada_Digital_s_cod INT,
	Detalle_Hospedaje_co_cod INT,
	Detalle_Hospedaje_s_cod INT	
);

ALTER TABLE Res_Pro_Ser ADD CONSTRAINT Res_Pro_Ser_PK PRIMARY KEY (Pro_Ser_Promocion_pr_cod, Pro_Ser_Servicio_s_cod);

CREATE TABLE Restaurante (
    re_cod SERIAL NOT NULL,
    re_nombre VARCHAR(50) NOT NULL,
    re_direccion VARCHAR(100) NOT NULL,
    re_calificacion NUMERIC(2) NOT NULL,
    Ambiente_am_cod INT NOT NULL,
    Lugar_l_cod INT NOT NULL
);

ALTER TABLE Restaurante ADD CONSTRAINT Restaurante_PK PRIMARY KEY (re_cod);
ALTER SEQUENCE restaurante_re_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Restaurante.re_cod IS 'Identificador del restaurante';
COMMENT ON COLUMN Restaurante.re_nombre IS 'Nombre del restaurante';
COMMENT ON COLUMN Restaurante.re_direccion IS 'Ubicacion de referencia';
COMMENT ON COLUMN Restaurante.re_calificacion IS 'Calificacion del restaurante';

CREATE TABLE Restriccion_Paquete (
	rp_cod SERIAL NOT NULL,
	rp_caracteristica VARCHAR(50) NOT NULL,
	rp_operador VARCHAR(20) NOT NULL,
	rp_valor_restriccion VARCHAR(100) NOT NULL
);

ALTER TABLE Restriccion_Paquete ADD CONSTRAINT Restriccion_Paquete_PK PRIMARY KEY (rp_cod);
ALTER SEQUENCE restriccion_paquete_rp_cod_seq RESTART WITH 1;

CREATE TABLE Rol (
    ro_cod SERIAL NOT NULL,
    ro_nombre VARCHAR(50) NOT NULL
);

ALTER TABLE Rol ADD CONSTRAINT Rol_PK PRIMARY KEY (ro_cod);
ALTER SEQUENCE rol_ro_cod_seq RESTART WITH 1;

CREATE TABLE Rol_Per (
    Rol_ro_cod INT NOT NULL,
    Permiso_pe_cod INT NOT NULL
);

ALTER TABLE Rol_Per ADD CONSTRAINT Rol_Per_PK PRIMARY KEY (Rol_ro_cod, Permiso_pe_cod);

CREATE TABLE Servicio (
    s_cod SERIAL NOT NULL,
    s_costo NUMERIC(12,2) NOT NULL,
	s_millas_otorgar INT NOT NULL
);

ALTER TABLE Servicio ADD CONSTRAINT Servicio_PK PRIMARY KEY (s_cod);
ALTER SEQUENCE servicio_s_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Servicio.s_cod IS 'Identificador del servicio';
COMMENT ON COLUMN Servicio.s_costo IS 'Costo del servicio';

CREATE TABLE Servicio_Adicional (
    s_cod INT NOT NULL,
    sa_nombre VARCHAR(50) NOT NULL,
    sa_descripcion VARCHAR(200) NOT NULL,
    sa_capacidad INT NOT NULL,
    Operador_Turistico_p_cod INT NOT NULL,
    Lugar_l_cod INT NOT NULL
);

ALTER TABLE Servicio_Adicional ADD CONSTRAINT Servicio_Adicional_PK PRIMARY KEY (s_cod);

COMMENT ON COLUMN Servicio_Adicional.s_cod IS 'Identificador del servicio';
COMMENT ON COLUMN Servicio_Adicional.sa_nombre IS 'Nombre otorgado al servicio adicional';
COMMENT ON COLUMN Servicio_Adicional.sa_descripcion IS 'Descripcion de la actividad';
COMMENT ON COLUMN Servicio_Adicional.sa_capacidad IS 'Capacidad de personas para la actividad por reserva';

CREATE TABLE Servicio_Barco (
    sb_cod SERIAL NOT NULL,
    sb_descripcion VARCHAR(200) NOT NULL,
    sb_costo NUMERIC(12,2) NOT NULL
);

ALTER TABLE Servicio_Barco ADD CONSTRAINT Servicio_Barco_PK PRIMARY KEY (sb_cod);
ALTER SEQUENCE servicio_barco_sb_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Servicio_Barco.sb_cod IS 'Identificador del servicio en el barco';
COMMENT ON COLUMN Servicio_Barco.sb_descripcion IS 'Detalles sobre el servicio';
COMMENT ON COLUMN Servicio_Barco.sb_costo IS 'Costo adicional por el servicio';

CREATE TABLE Tasa_Cambio (
    tca_cod SERIAL NOT NULL,
    tca_divisa_origen VARCHAR(50) NOT NULL,
    tca_valor_tasa NUMERIC(10,4) NOT NULL,
    tca_fecha_hora_tasa TIMESTAMP NOT NULL,
	tca_fecha_hora_fin TIMESTAMP
);

ALTER TABLE Tasa_Cambio ADD CONSTRAINT Tasa_Cambio_PK PRIMARY KEY (tca_cod);
ALTER SEQUENCE tasa_cambio_tca_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Tasa_Cambio.tca_cod IS 'Identificador de la tasa de cambio';
COMMENT ON COLUMN Tasa_Cambio.tca_divisa_origen IS 'La divisa a la cual aplicar la tasa';
COMMENT ON COLUMN Tasa_Cambio.tca_valor_tasa IS 'Valor de conversion a utilizar';
COMMENT ON COLUMN Tasa_Cambio.tca_fecha_hora_tasa IS 'Fecha y hora vigente de la tasa';

CREATE TABLE Tas_Lug (
    Tasa_Cambio_tca_cod INT NOT NULL,
    Lugar_l_cod INT NOT NULL
);

ALTER TABLE Tas_Lug ADD CONSTRAINT Tas_Lug_PK PRIMARY KEY (Tasa_Cambio_tca_cod, Lugar_l_cod);

CREATE TABLE Telefono (
    t_cod SERIAL NOT NULL,
    t_cod_pais NUMERIC(3) NOT NULL,
    t_cod_area SMALLINT NOT NULL,
    t_numero INT NOT NULL,
    Cliente_c_cod INT,
    Operador_Turistico_p_cod INT
);

ALTER TABLE Telefono ADD CONSTRAINT Telefono_PK PRIMARY KEY (t_cod);
ALTER SEQUENCE telefono_t_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Telefono.t_cod IS 'Identificacion del tlf';
COMMENT ON COLUMN Telefono.t_cod_pais IS 'Codigo del pais (numero)';
COMMENT ON COLUMN Telefono.t_cod_area IS 'Codigo de area del telefono';
COMMENT ON COLUMN Telefono.t_numero IS 'Numero unico del telefono';

CREATE TABLE Terminal_Operacion (
    to_cod SERIAL NOT NULL,
    to_direccion VARCHAR(100) NOT NULL,
    Lugar_l_cod INT NOT NULL,
    Transporte_Terrestre_p_cod INT NOT NULL
);

ALTER TABLE Terminal_Operacion ADD CONSTRAINT Terminal_Operacion_PK PRIMARY KEY (to_cod);
ALTER SEQUENCE terminal_operacion_to_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Terminal_Operacion.to_cod IS 'Identificacion de la terminal';
COMMENT ON COLUMN Terminal_Operacion.to_direccion IS 'Ubicacion de la terminal';

CREATE TABLE Tipo_Camarote (
    tc_cod SERIAL NOT NULL,
    tc_nombre VARCHAR(50) NOT NULL,
    tc_descripcion VARCHAR(200) NOT NULL,
    tc_capacidad INTEGER NOT NULL,
    tc_costo NUMERIC(12,2) NOT NULL
);

ALTER TABLE Tipo_Camarote ADD CONSTRAINT Tipo_Camarote_PK PRIMARY KEY (tc_cod);
ALTER SEQUENCE tipo_camarote_tc_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Tipo_Camarote.tc_cod IS 'Identificador del tipo de camarote';
COMMENT ON COLUMN Tipo_Camarote.tc_nombre IS 'Nombre otorgado al tipo de camarote';
COMMENT ON COLUMN Tipo_Camarote.tc_descripcion IS 'Detalles sobre el tipo de camarote';
COMMENT ON COLUMN Tipo_Camarote.tc_capacidad IS 'Capacidad de personas para el tipo de camarote';
COMMENT ON COLUMN Tipo_Camarote.tc_costo IS 'Costo del tipo de camarote';

CREATE TABLE Tipo_Documento (
    td_cod SERIAL NOT NULL,
    td_nombre VARCHAR(50) NOT NULL
);

ALTER TABLE Tipo_Documento ADD CONSTRAINT Tipo_Documento_PK PRIMARY KEY (td_cod);
ALTER SEQUENCE tipo_documento_td_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Tipo_Documento.td_cod IS 'Identificacion del tipo de documento';
COMMENT ON COLUMN Tipo_Documento.td_nombre IS 'Nombre del tipo de documento';

CREATE TABLE Tipo_Habitacion (
    th_cod SERIAL NOT NULL,
    th_nombre VARCHAR(50) NOT NULL,
    th_descripcion VARCHAR(200) NOT NULL
);

ALTER TABLE Tipo_Habitacion ADD CONSTRAINT Tipo_Habitacion_PK PRIMARY KEY (th_cod);
ALTER SEQUENCE tipo_habitacion_th_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Tipo_Habitacion.th_cod IS 'Identificador del tipo de habitacion';
COMMENT ON COLUMN Tipo_Habitacion.th_nombre IS 'Denominacion otorgada al tipo de habitacion';
COMMENT ON COLUMN Tipo_Habitacion.th_descripcion IS 'Detalles sobre el tipo de habitacion';

CREATE TABLE Transporte_Terrestre (
    p_cod SERIAL NOT NULL,
	p_nombre VARCHAR(50) NOT NULL,
	p_fecha_afiliacion DATE NOT NULL,
    Lugar_l_cod INT NOT NULL
);

ALTER TABLE Transporte_Terrestre ADD CONSTRAINT Transporte_Terrestre_PK PRIMARY KEY (p_cod);
ALTER SEQUENCE transporte_terrestre_p_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Transporte_Terrestre.p_cod IS 'Identificacion del proveedor';

CREATE TABLE Traslado (
    s_cod SERIAL NOT NULL,
    t_distancia_km NUMERIC(10,2) NOT NULL,
    Transporte_Terrestre_p_cod INT NOT NULL,
    Lugar_l_cod INT NOT NULL,
    Terminal_Operacion_to_cod INT NOT NULL
);

ALTER TABLE Traslado ADD CONSTRAINT Traslado_PK PRIMARY KEY (s_cod);
ALTER SEQUENCE traslado_s_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Traslado.s_cod IS 'Identificador del servicio';
COMMENT ON COLUMN Traslado.t_distancia_km IS 'Distancia de km del traslado';

CREATE TABLE Usuario (
    u_cod SERIAL NOT NULL,
    u_username VARCHAR(50) NOT NULL,
    u_correo VARCHAR(50) NOT NULL,
    u_hash_clave VARCHAR(100) NOT NULL,
    Rol_ro_cod INT NOT NULL,
    Empleado_e_cod INT,
    Cliente_c_cod INT,
    Aerolinea_p_cod INT,
	Transporte_Terrestre_p_cod INT,
	Crucero_p_cod INT,
	Operador_Turistico_p_cod INT,
	Hotel_p_cod INT
);

ALTER TABLE Usuario ADD CONSTRAINT Usuario_PK PRIMARY KEY (u_cod);
ALTER SEQUENCE usuario_u_cod_seq RESTART WITH 1;

CREATE TABLE Viaje (
    s_cod INT NOT NULL,
    vi_fecha_hora_salida TIMESTAMP NOT NULL,
    vi_duracion_dias INT NOT NULL,
    vi_distancia_km NUMERIC(10) NOT NULL,
    Crucero_p_cod INT NOT NULL,
    Lugar_l_cod INT NOT NULL,
    Lugar_l_cod2 INT NOT NULL,
    Barco_mt_cod INT NOT NULL
);

ALTER TABLE Viaje ADD CONSTRAINT Viaje_PK PRIMARY KEY (s_cod);

COMMENT ON COLUMN Viaje.s_cod IS 'Identificador del servicio';
COMMENT ON COLUMN Viaje.vi_fecha_hora_salida IS 'Fecha y hora de salida del crucero';
COMMENT ON COLUMN Viaje.vi_duracion_dias IS 'Cantidad de dias del viaje en crucero';
COMMENT ON COLUMN Viaje.vi_distancia_km IS 'Distancia en km del viaje en crucero';

CREATE TABLE Viajero (
    via_cod SERIAL NOT NULL,
    via_p_nombre VARCHAR(50) NOT NULL,
    via_s_nombre VARCHAR(50),
    via_p_apellido VARCHAR(50) NOT NULL,
    via_s_apellido VARCHAR(50),
    via_correo VARCHAR(50) NOT NULL,
    via_fecha_nacimiento DATE NOT NULL
);

ALTER TABLE Viajero ADD CONSTRAINT Viajero_PK PRIMARY KEY (via_cod);
ALTER SEQUENCE viajero_via_cod_seq RESTART WITH 1;

COMMENT ON COLUMN Viajero.via_cod IS 'Identificador del viajero';
COMMENT ON COLUMN Viajero.via_p_nombre IS 'Nombre del viajero';
COMMENT ON COLUMN Viajero.via_s_nombre IS 'Segundo nombre del viajero';
COMMENT ON COLUMN Viajero.via_p_apellido IS 'Primer apellido del viajero';
COMMENT ON COLUMN Viajero.via_s_apellido IS 'Segundo apellido del viajero';
COMMENT ON COLUMN Viajero.via_correo IS 'Correo para contactar al viajero';
COMMENT ON COLUMN Viajero.via_fecha_nacimiento IS 'Fecha de nacimiento del viajero';

CREATE TABLE Via_Res (
    via_res_cod SERIAL NOT NULL,
	Viajero_via_cod INT NOT NULL,
	Boleto_Vuelo_co_cod INT,
	Boleto_Vuelo_s_cod INT,
	Detalle_Traslado_co_cod INT,
	Detalle_Traslado_s_cod INT,
	Boleto_Viaje_co_cod INT,
	Boleto_Viaje_s_cod INT,
	Entrada_Digital_co_cod INT,
	Entrada_Digital_s_cod INT,
	Detalle_Hospedaje_co_cod INT,
	Detalle_Hospedaje_s_cod INT	
);

ALTER TABLE Via_Res ADD CONSTRAINT Via_Res_PK PRIMARY KEY (Viajero_via_cod, via_res_cod);
ALTER SEQUENCE via_res_via_res_cod_seq RESTART WITH 1;

CREATE TABLE Vuelo (
    s_cod INT NOT NULL,
    v_cod_vue VARCHAR(10) NOT NULL,
    v_fecha_hora_salida TIMESTAMP NOT NULL,
    v_duracion_horas NUMERIC(5,1) NOT NULL,
    v_distancia_km NUMERIC(10) NOT NULL,
    Aerolinea_p_cod INT NOT NULL,
    Lugar_l_cod2 INT NOT NULL,
    Lugar_l_cod INT NOT NULL,
    Aeronave_mt_cod INT NOT NULL
);

ALTER TABLE Vuelo ADD CONSTRAINT Vuelo_PK PRIMARY KEY (s_cod);

COMMENT ON COLUMN Vuelo.s_cod IS 'Identificador del servicio';
COMMENT ON COLUMN Vuelo.v_cod_vue IS 'Codigo alfanumerico del vuelo';
COMMENT ON COLUMN Vuelo.v_fecha_hora_salida IS 'Fecha y hora de salida';
COMMENT ON COLUMN Vuelo.v_duracion_horas IS 'Duracion en horas del vuelo';
COMMENT ON COLUMN Vuelo.v_distancia_km IS 'Distancia en km del vuelo';

-- ===================================================
-- CREATE - INDICES
-- ===================================================

CREATE UNIQUE INDEX Nota_Credito__IDX ON Nota_Credito (Reembolso_ree_cod ASC);
-- CREATE UNIQUE INDEX Queja__IDX ON Queja (Reserva_Compra_co_cod ASC);
-- CREATE UNIQUE INDEX Reembolso__IDX ON Reembolso (Reserva_co_cod ASC);
-- CREATE UNIQUE INDEX Resena__IDX ON Resena (Reserva_Compra_co_cod ASC);
CREATE UNIQUE INDEX Telefono__IDX ON Telefono (Operador_Turistico_p_cod ASC);
CREATE UNIQUE INDEX Usuario__IDX ON Usuario (Empleado_e_cod ASC);
CREATE UNIQUE INDEX Usuario__IDXv1 ON Usuario (Cliente_c_cod ASC);

-- ===================================================
-- ALTER - CLAVES FORANEAS
-- ===================================================

ALTER TABLE Aer_Cla   ADD CONSTRAINT Aer_Cla_Clase_Asiento_FK FOREIGN KEY (Clase_Asiento_ca_cod) REFERENCES Clase_Asiento (ca_cod);
ALTER TABLE Aerolinea ADD CONSTRAINT Aerolinea_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Aeronave  ADD CONSTRAINT Aeronave_Aerolinea_FK FOREIGN KEY (Aerolinea_p_cod) REFERENCES Aerolinea (p_cod);
ALTER TABLE Aeronave  ADD CONSTRAINT Aeronave_Modelo_FK FOREIGN KEY (Modelo_mv_cod) REFERENCES Modelo (mv_cod);
ALTER TABLE Auditoria ADD CONSTRAINT Auditoria_Usuario_FK FOREIGN KEY (Usuario_u_cod) REFERENCES Usuario (u_cod);
ALTER TABLE Automovil ADD CONSTRAINT Automovil_Modelo_FK FOREIGN KEY (Modelo_mv_cod) REFERENCES Modelo (mv_cod);
ALTER TABLE Automovil ADD CONSTRAINT Automovil_Transporte_Terrestre_FK FOREIGN KEY (Transporte_Terrestre_p_cod) REFERENCES Transporte_Terrestre (p_cod);
ALTER TABLE Barco ADD CONSTRAINT Barco_Crucero_FK FOREIGN KEY (Crucero_p_cod) REFERENCES Crucero (p_cod);
ALTER TABLE Barco ADD CONSTRAINT Barco_Modelo_FK FOREIGN KEY (Modelo_mv_cod) REFERENCES Modelo (mv_cod);
ALTER TABLE Bar_Ser ADD CONSTRAINT Bar_Ser_Barco_FK FOREIGN KEY (Barco_mt_cod) REFERENCES Barco (mt_cod);
ALTER TABLE Bar_Ser ADD CONSTRAINT Bar_Ser_Servicio_Barco_FK FOREIGN KEY (Servicio_Barco_sb_cod) REFERENCES Servicio_Barco (sb_cod);
ALTER TABLE Bar_Tip ADD CONSTRAINT Bar_Tip_Barco_FK FOREIGN KEY (Barco_mt_cod) REFERENCES Barco (mt_cod);
ALTER TABLE Bar_Tip ADD CONSTRAINT Bar_Tip_Tipo_Camarote_FK FOREIGN KEY (Tipo_Camarote_tc_cod) REFERENCES Tipo_Camarote (tc_cod);
ALTER TABLE Boleto_Viaje ADD CONSTRAINT Boleto_Viaje_Compra_FK FOREIGN KEY (Compra_co_cod) REFERENCES Compra (co_cod);
ALTER TABLE Boleto_Viaje ADD CONSTRAINT Boleto_Viaje_Servicio_Barco_FK FOREIGN KEY (Servicio_Barco_sb_cod) REFERENCES Servicio_Barco (sb_cod);
ALTER TABLE Boleto_Viaje ADD CONSTRAINT Boleto_Viaje_Tipo_Camarote_FK FOREIGN KEY (Tipo_Camarote_tc_cod) REFERENCES Tipo_Camarote (tc_cod);
ALTER TABLE Boleto_Viaje ADD CONSTRAINT Boleto_Viaje_Viaje_FK FOREIGN KEY (Viaje_s_cod) REFERENCES Viaje (s_cod);
ALTER TABLE Boleto_Viaje ADD CONSTRAINT Boleto_Viaje_Tasa_Cambio_FK FOREIGN KEY (Tasa_Cambio_tca_cod) REFERENCES Tasa_Cambio (tca_cod);
ALTER TABLE Boleto_Vuelo ADD CONSTRAINT Boleto_Vuelo_Clase_Asiento_FK FOREIGN KEY (Clase_Asiento_ca_cod) REFERENCES Clase_Asiento (ca_cod);
ALTER TABLE Boleto_Vuelo ADD CONSTRAINT Boleto_Vuelo_Compra_FK FOREIGN KEY (Compra_co_cod) REFERENCES Compra (co_cod);
ALTER TABLE Boleto_Vuelo ADD CONSTRAINT Boleto_Vuelo_Vuelo_FK FOREIGN KEY (Vuelo_s_cod) REFERENCES Vuelo (s_cod);
ALTER TABLE Boleto_Vuelo ADD CONSTRAINT Boleto_Vuelo_Tasa_Cambio_FK FOREIGN KEY (Tasa_Cambio_tca_cod) REFERENCES Tasa_Cambio (tca_cod);
ALTER TABLE Cliente ADD CONSTRAINT Cliente_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Compra ADD CONSTRAINT Compra_Cliente_FK FOREIGN KEY (Cliente_c_cod) REFERENCES Cliente (c_cod);
ALTER TABLE Compra ADD CONSTRAINT Compra_Paquete_FK FOREIGN KEY (Paquete_Turistico_pt_cod) REFERENCES Paquete_Turistico(pt_cod);
ALTER TABLE Crucero ADD CONSTRAINT Crucero_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Cuota ADD CONSTRAINT Cuota_Compra_FK FOREIGN KEY (Compra_co_cod) REFERENCES Compra (co_cod);
ALTER TABLE Deseo_Paquete ADD CONSTRAINT Deseo_Paquete_Cliente_FK FOREIGN KEY (Cliente_c_cod) REFERENCES Cliente (c_cod);
ALTER TABLE Deseo_Paquete ADD CONSTRAINT Deseo_Paquete_Paquete_Turistico_FK FOREIGN KEY (Paquete_Turistico_pt_cod) REFERENCES Paquete_Turistico (pt_cod);
ALTER TABLE Deseo_Servicio ADD CONSTRAINT Deseo_Servicio_Cliente_FK FOREIGN KEY (Cliente_c_cod) REFERENCES Cliente (c_cod);
ALTER TABLE Deseo_Servicio ADD CONSTRAINT Deseo_Servicio_Servicio_FK FOREIGN KEY (Servicio_s_cod) REFERENCES Servicio (s_cod);
ALTER TABLE Detalle_Hospedaje ADD CONSTRAINT Detalle_Hospedaje_Habitacion_FK FOREIGN KEY (Habitacion_s_cod) REFERENCES Habitacion (s_cod);
ALTER TABLE Detalle_Hospedaje ADD CONSTRAINT Detalle_Hospedaje_Compra_FK FOREIGN KEY (Compra_co_cod) REFERENCES Compra (co_cod);
ALTER TABLE Detalle_Hospedaje ADD CONSTRAINT Detalle_Hospedaje_Tasa_Cambio_FK FOREIGN KEY (Tasa_Cambio_tca_cod) REFERENCES Tasa_Cambio (tca_cod);
ALTER TABLE Detalle_Traslado ADD CONSTRAINT Detalle_Traslado_Automovil_FK FOREIGN KEY (Automovil_mt_cod) REFERENCES Automovil (mt_cod);
ALTER TABLE Detalle_Traslado ADD CONSTRAINT Detalle_Traslado_Compra_FK FOREIGN KEY (Compra_co_cod) REFERENCES Compra (co_cod);
ALTER TABLE Detalle_Traslado ADD CONSTRAINT Detalle_Traslado_Traslado_FK FOREIGN KEY (Traslado_s_cod) REFERENCES Traslado (s_cod);
ALTER TABLE Detalle_Traslado ADD CONSTRAINT Detalle_Traslado_Tasa_Cambio_FK FOREIGN KEY (Tasa_Cambio_tca_cod) REFERENCES Tasa_Cambio (tca_cod);
ALTER TABLE Documento ADD CONSTRAINT Documento_Cliente_FK FOREIGN KEY (Cliente_c_cod) REFERENCES Cliente (c_cod);
ALTER TABLE Documento ADD CONSTRAINT Documento_Tipo_Documento_FK FOREIGN KEY (Tipo_Documento_td_cod) REFERENCES Tipo_Documento (td_cod);
ALTER TABLE Entrada_Digital ADD CONSTRAINT Entrada_Digital_Compra_FK FOREIGN KEY (Compra_co_cod) REFERENCES Compra (co_cod);
ALTER TABLE Entrada_Digital ADD CONSTRAINT Entrada_Digital_Servicio_Adicional_FK FOREIGN KEY (Servicio_Adicional_s_cod) REFERENCES Servicio_Adicional (s_cod);
ALTER TABLE Entrada_Digital ADD CONSTRAINT Entrada_Digital_Tasa_Cambio_FK FOREIGN KEY (Tasa_Cambio_tca_cod) REFERENCES Tasa_Cambio (tca_cod);
ALTER TABLE Eti_Cli ADD CONSTRAINT Eti_Cli_Cliente_FK FOREIGN KEY (Cliente_c_cod) REFERENCES Cliente (c_cod);
ALTER TABLE Eti_Cli ADD CONSTRAINT Eti_Cli_Etiqueta_FK FOREIGN KEY (Etiqueta_et_cod) REFERENCES Etiqueta (et_cod);
ALTER TABLE Eti_Paq ADD CONSTRAINT Eti_Paq_Etiqueta_FK FOREIGN KEY (Etiqueta_et_cod) REFERENCES Etiqueta (et_cod);
ALTER TABLE Eti_Paq ADD CONSTRAINT Eti_Paq_Paquete_Turistico_FK FOREIGN KEY (Paquete_Turistico_pt_cod) REFERENCES Paquete_Turistico (pt_cod);
ALTER TABLE Eti_Ser ADD CONSTRAINT Eti_Ser_Etiqueta_FK FOREIGN KEY (Etiqueta_et_cod) REFERENCES Etiqueta (et_cod);
ALTER TABLE Eti_Ser ADD CONSTRAINT Eti_Ser_Servicio_FK FOREIGN KEY (Servicio_s_cod) REFERENCES Servicio (s_cod);
ALTER TABLE Habitacion ADD CONSTRAINT Habitacion_Hotel_FK FOREIGN KEY (Hotel_p_cod) REFERENCES Hotel (p_cod);
ALTER TABLE Habitacion ADD CONSTRAINT Habitacion_Servicio_FK FOREIGN KEY (s_cod) REFERENCES Servicio (s_cod);
ALTER TABLE Habitacion ADD CONSTRAINT Habitacion_Tipo_Habitacion_FK FOREIGN KEY (Tipo_Habitacion_th_cod) REFERENCES Tipo_Habitacion (th_cod);
ALTER TABLE Hotel ADD CONSTRAINT Hotel_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Lugar ADD CONSTRAINT Lugar_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Metodo_Pago ADD CONSTRAINT Metodo_Pago_Cliente_FK FOREIGN KEY (Cliente_c_cod) REFERENCES Cliente (c_cod);
ALTER TABLE Metodo_Pago ADD CONSTRAINT Metodo_Pago_Cliente_Millas_FK FOREIGN KEY (m_Cliente_cod) REFERENCES Cliente (c_cod);
ALTER TABLE Metodo_Pago ADD CONSTRAINT Metodo_Pago_Banco1_FK FOREIGN KEY (t_Banco_cod) REFERENCES Banco (ba_cod);
ALTER TABLE Metodo_Pago ADD CONSTRAINT Metodo_Pago_Banco2_FK FOREIGN KEY (c_Banco_cod) REFERENCES Banco (ba_cod);
ALTER TABLE Metodo_Pago ADD CONSTRAINT Metodo_Pago_Banco3_FK FOREIGN KEY (de_Banco_cod) REFERENCES Banco (ba_cod);
ALTER TABLE Modelo ADD CONSTRAINT Modelo_Marca_FK FOREIGN KEY (Marca_mav_cod) REFERENCES Marca (mav_cod);
ALTER TABLE Nota_Credito ADD CONSTRAINT Nota_Credito_Metodo_Pago_FK FOREIGN KEY (Metodo_Pago_mp_cod) REFERENCES Metodo_Pago (mp_cod);
ALTER TABLE Nota_Credito ADD CONSTRAINT Nota_Credito_Reembolso_FK FOREIGN KEY (Reembolso_ree_cod) REFERENCES Reembolso (ree_cod);
ALTER TABLE Operador_Turistico ADD CONSTRAINT Operador_Turistico_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Pago ADD CONSTRAINT Pago_Compra_FK FOREIGN KEY (Compra_co_cod) REFERENCES Compra (co_cod);
ALTER TABLE Pago ADD CONSTRAINT Pago_Metodo_Pago_FK FOREIGN KEY (Metodo_Pago_mp_cod) REFERENCES Metodo_Pago (mp_cod);
ALTER TABLE Pago_Cuota ADD CONSTRAINT Pago_Cuota_Cuota_FK FOREIGN KEY (Cuota_cu_cod) REFERENCES Cuota (cu_cod);
ALTER TABLE Pago_Cuota ADD CONSTRAINT Pago_Cuota_Metodo_Pago_FK FOREIGN KEY (Metodo_Pago_mp_cod) REFERENCES Metodo_Pago (mp_cod);
ALTER TABLE Paquete_Turistico ADD CONSTRAINT Paquete_Turistico_Restriccion_FK FOREIGN KEY (Restriccion_Paquete_rp_cod) REFERENCES Restriccion_Paquete (rp_cod);
ALTER TABLE Paq_Ser ADD CONSTRAINT Paq_Ser_Paquete_Turistico_FK FOREIGN KEY (Paquete_Turistico_pt_cod) REFERENCES Paquete_Turistico (pt_cod);
ALTER TABLE Paq_Ser ADD CONSTRAINT Paq_Ser_Servicio_FK FOREIGN KEY (Servicio_s_cod) REFERENCES Servicio (s_cod);
ALTER TABLE Promocion ADD CONSTRAINT Promocion_Aerolinea_FK FOREIGN KEY (Aerolinea_p_cod) REFERENCES Aerolinea (p_cod);
ALTER TABLE Promocion ADD CONSTRAINT Promocion_Terrestre_FK FOREIGN KEY (Transporte_Terrestre_p_cod) REFERENCES Transporte_Terrestre (p_cod);
ALTER TABLE Promocion ADD CONSTRAINT Promocion_Crucero_FK FOREIGN KEY (Crucero_p_cod) REFERENCES Crucero (p_cod);
ALTER TABLE Promocion ADD CONSTRAINT Promocion_Turistico_FK FOREIGN KEY (Operador_Turistico_p_cod) REFERENCES Operador_Turistico (p_cod);
ALTER TABLE Promocion ADD CONSTRAINT Promocion_Hotel_FK FOREIGN KEY (Hotel_p_cod) REFERENCES Hotel (p_cod);
ALTER TABLE Pro_Ser ADD CONSTRAINT Pro_Ser_Promocion_FK FOREIGN KEY (Promocion_pr_cod) REFERENCES Promocion (pr_cod);
ALTER TABLE Pro_Ser ADD CONSTRAINT Pro_Ser_Servicio_FK FOREIGN KEY (Servicio_s_cod) REFERENCES Servicio (s_cod);
ALTER TABLE Queja ADD CONSTRAINT Queja_Empleado_FK FOREIGN KEY (Empleado_e_cod) REFERENCES Empleado (e_cod);
ALTER TABLE Queja ADD CONSTRAINT Queja_Boleto_Vuelo_FK FOREIGN KEY (Boleto_Vuelo_co_cod, Boleto_Vuelo_s_cod) REFERENCES Boleto_Vuelo (Compra_co_cod, Vuelo_s_cod);
ALTER TABLE Queja ADD CONSTRAINT Queja_Detalle_Traslado_FK FOREIGN KEY (Detalle_Traslado_co_cod, Detalle_Traslado_s_cod) REFERENCES Detalle_Traslado (Compra_co_cod, Traslado_s_cod);
ALTER TABLE Queja ADD CONSTRAINT Queja_Boleto_Viaje_FK FOREIGN KEY (Boleto_Viaje_co_cod, Boleto_Viaje_s_cod) REFERENCES Boleto_Viaje (Compra_co_cod, Viaje_s_cod);
ALTER TABLE Queja ADD CONSTRAINT Queja_Entrada_Digital_FK FOREIGN KEY (Entrada_Digital_co_cod, Entrada_Digital_s_cod) REFERENCES Entrada_Digital (Compra_co_cod, Servicio_Adicional_s_cod);
ALTER TABLE Queja ADD CONSTRAINT Queja_Detalle_Hospedaje_FK FOREIGN KEY (Detalle_Hospedaje_co_cod, Detalle_Hospedaje_s_cod) REFERENCES Detalle_Hospedaje (Compra_co_cod, Habitacion_s_cod);
ALTER TABLE Res_Pro_Ser ADD CONSTRAINT Res_Pro_Ser_Boleto_Vuelo_FK FOREIGN KEY (Boleto_Vuelo_co_cod, Boleto_Vuelo_s_cod) REFERENCES Boleto_Vuelo (Compra_co_cod, Vuelo_s_cod);
ALTER TABLE Res_Pro_Ser ADD CONSTRAINT Res_Pro_Ser_Detalle_Traslado_FK FOREIGN KEY (Detalle_Traslado_co_cod, Detalle_Traslado_s_cod) REFERENCES Detalle_Traslado (Compra_co_cod, Traslado_s_cod);
ALTER TABLE Res_Pro_Ser ADD CONSTRAINT Res_Pro_Ser_Boleto_Viaje_FK FOREIGN KEY (Boleto_Viaje_co_cod, Boleto_Viaje_s_cod) REFERENCES Boleto_Viaje (Compra_co_cod, Viaje_s_cod);
ALTER TABLE Res_Pro_Ser ADD CONSTRAINT Res_Pro_Ser_Entrada_Digital_FK FOREIGN KEY (Entrada_Digital_co_cod, Entrada_Digital_s_cod) REFERENCES Entrada_Digital (Compra_co_cod, Servicio_Adicional_s_cod);
ALTER TABLE Res_Pro_Ser ADD CONSTRAINT Res_Pro_Ser_Detalle_Hospedaje_FK FOREIGN KEY (Detalle_Hospedaje_co_cod, Detalle_Hospedaje_s_cod) REFERENCES Detalle_Hospedaje (Compra_co_cod, Habitacion_s_cod);
ALTER TABLE Reembolso ADD CONSTRAINT Reembolso_Boleto_Vuelo_FK FOREIGN KEY (Boleto_Vuelo_co_cod, Boleto_Vuelo_s_cod) REFERENCES Boleto_Vuelo (Compra_co_cod, Vuelo_s_cod);
ALTER TABLE Reembolso ADD CONSTRAINT Reembolso_Detalle_Traslado_FK FOREIGN KEY (Detalle_Traslado_co_cod, Detalle_Traslado_s_cod) REFERENCES Detalle_Traslado (Compra_co_cod, Traslado_s_cod);
ALTER TABLE Reembolso ADD CONSTRAINT Reembolso_Boleto_Viaje_FK FOREIGN KEY (Boleto_Viaje_co_cod, Boleto_Viaje_s_cod) REFERENCES Boleto_Viaje (Compra_co_cod, Viaje_s_cod);
ALTER TABLE Reembolso ADD CONSTRAINT Reembolso_Entrada_Digital_FK FOREIGN KEY (Entrada_Digital_co_cod, Entrada_Digital_s_cod) REFERENCES Entrada_Digital (Compra_co_cod, Servicio_Adicional_s_cod);
ALTER TABLE Reembolso ADD CONSTRAINT Reembolso_Detalle_Hospedaje_FK FOREIGN KEY (Detalle_Hospedaje_co_cod, Detalle_Hospedaje_s_cod) REFERENCES Detalle_Hospedaje (Compra_co_cod, Habitacion_s_cod);
ALTER TABLE Resena ADD CONSTRAINT Resena_Boleto_Vuelo_FK FOREIGN KEY (Boleto_Vuelo_co_cod, Boleto_Vuelo_s_cod) REFERENCES Boleto_Vuelo (Compra_co_cod, Vuelo_s_cod);
ALTER TABLE Resena ADD CONSTRAINT Resena_Detalle_Traslado_FK FOREIGN KEY (Detalle_Traslado_co_cod, Detalle_Traslado_s_cod) REFERENCES Detalle_Traslado (Compra_co_cod, Traslado_s_cod);
ALTER TABLE Resena ADD CONSTRAINT Resena_Boleto_Viaje_FK FOREIGN KEY (Boleto_Viaje_co_cod, Boleto_Viaje_s_cod) REFERENCES Boleto_Viaje (Compra_co_cod, Viaje_s_cod);
ALTER TABLE Resena ADD CONSTRAINT Resena_Entrada_Digital_FK FOREIGN KEY (Entrada_Digital_co_cod, Entrada_Digital_s_cod) REFERENCES Entrada_Digital (Compra_co_cod, Servicio_Adicional_s_cod);
ALTER TABLE Resena ADD CONSTRAINT Resena_Detalle_Hospedaje_FK FOREIGN KEY (Detalle_Hospedaje_co_cod, Detalle_Hospedaje_s_cod) REFERENCES Detalle_Hospedaje (Compra_co_cod, Habitacion_s_cod);
ALTER TABLE Restaurante ADD CONSTRAINT Restaurante_Ambiente_FK FOREIGN KEY (Ambiente_am_cod) REFERENCES Ambiente (am_cod);
ALTER TABLE Restaurante ADD CONSTRAINT Restaurante_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Rol_Per ADD CONSTRAINT Rol_Per_Permiso_FK FOREIGN KEY (Permiso_pe_cod) REFERENCES Permiso (pe_cod);
ALTER TABLE Rol_Per ADD CONSTRAINT Rol_Per_Rol_FK FOREIGN KEY (Rol_ro_cod) REFERENCES Rol (ro_cod);
ALTER TABLE Servicio_Adicional ADD CONSTRAINT Servicio_Adicional_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Servicio_Adicional ADD CONSTRAINT Servicio_Adicional_Operador_Turistico_FK FOREIGN KEY (Operador_Turistico_p_cod) REFERENCES Operador_Turistico (p_cod);
ALTER TABLE Servicio_Adicional ADD CONSTRAINT Servicio_Adicional_Servicio_FK FOREIGN KEY (s_cod) REFERENCES Servicio (s_cod);
ALTER TABLE Tas_Lug ADD CONSTRAINT Tas_Lug_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Tas_Lug ADD CONSTRAINT Tas_Lug_Tasa_Cambio_FK FOREIGN KEY (Tasa_Cambio_tca_cod) REFERENCES Tasa_Cambio (tca_cod);
ALTER TABLE Telefono ADD CONSTRAINT Telefono_Cliente_FK FOREIGN KEY (Cliente_c_cod) REFERENCES Cliente (c_cod);
ALTER TABLE Telefono ADD CONSTRAINT Telefono_Operador_Turistico_FK FOREIGN KEY (Operador_Turistico_p_cod) REFERENCES Operador_Turistico (p_cod);
ALTER TABLE Terminal_Operacion ADD CONSTRAINT Terminal_Operacion_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Terminal_Operacion ADD CONSTRAINT Terminal_Operacion_Transporte_Terrestre_FK FOREIGN KEY (Transporte_Terrestre_p_cod) REFERENCES Transporte_Terrestre (p_cod);
ALTER TABLE Transporte_Terrestre ADD CONSTRAINT Transporte_Terrestre_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Traslado ADD CONSTRAINT Traslado_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Traslado ADD CONSTRAINT Traslado_Servicio_FK FOREIGN KEY (s_cod) REFERENCES Servicio (s_cod);
ALTER TABLE Traslado ADD CONSTRAINT Traslado_Terminal_Operacion_FK FOREIGN KEY (Terminal_Operacion_to_cod) REFERENCES Terminal_Operacion (to_cod);
ALTER TABLE Traslado ADD CONSTRAINT Traslado_Transporte_Terrestre_FK FOREIGN KEY (Transporte_Terrestre_p_cod) REFERENCES Transporte_Terrestre (p_cod);
ALTER TABLE Usuario ADD CONSTRAINT Usuario_Cliente_FK FOREIGN KEY (Cliente_c_cod) REFERENCES Cliente (c_cod);
ALTER TABLE Usuario ADD CONSTRAINT Usuario_Empleado_FK FOREIGN KEY (Empleado_e_cod) REFERENCES Empleado (e_cod);
ALTER TABLE Usuario ADD CONSTRAINT Usuario_Aerolinea_FK FOREIGN KEY (Aerolinea_p_cod) REFERENCES Aerolinea (p_cod);
ALTER TABLE Usuario ADD CONSTRAINT Usuario_Terrestre_FK FOREIGN KEY (Transporte_Terrestre_p_cod) REFERENCES Transporte_Terrestre (p_cod);
ALTER TABLE Usuario ADD CONSTRAINT Usuario_Crucero_FK FOREIGN KEY (Crucero_p_cod) REFERENCES Crucero (p_cod);
ALTER TABLE Usuario ADD CONSTRAINT Usuario_Turistico_FK FOREIGN KEY (Operador_Turistico_p_cod) REFERENCES Operador_Turistico (p_cod);
ALTER TABLE Usuario ADD CONSTRAINT Usuario_Hotel_FK FOREIGN KEY (Hotel_p_cod) REFERENCES Hotel (p_cod);
ALTER TABLE Usuario ADD CONSTRAINT Usuario_Rol_FK FOREIGN KEY (Rol_ro_cod) REFERENCES Rol (ro_cod);
ALTER TABLE Viaje ADD CONSTRAINT Viaje_Barco_FK FOREIGN KEY (Barco_mt_cod) REFERENCES Barco (mt_cod);
ALTER TABLE Viaje ADD CONSTRAINT Viaje_Crucero_FK FOREIGN KEY (Crucero_p_cod) REFERENCES Crucero (p_cod);
ALTER TABLE Viaje ADD CONSTRAINT Viaje_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Viaje ADD CONSTRAINT Viaje_Lugar_FKv2 FOREIGN KEY (Lugar_l_cod2) REFERENCES Lugar (l_cod);
ALTER TABLE Viaje ADD CONSTRAINT Viaje_Servicio_FK FOREIGN KEY (s_cod) REFERENCES Servicio (s_cod);
ALTER TABLE Via_Res ADD CONSTRAINT Via_Res_Viajero_FK FOREIGN KEY (Viajero_via_cod) REFERENCES Viajero (via_cod);
ALTER TABLE Via_Res ADD CONSTRAINT Via_Res_Boleto_Vuelo_FK FOREIGN KEY (Boleto_Vuelo_co_cod, Boleto_Vuelo_s_cod) REFERENCES Boleto_Vuelo (Compra_co_cod, Vuelo_s_cod);
ALTER TABLE Via_Res ADD CONSTRAINT Via_Res_Detalle_Traslado_FK FOREIGN KEY (Detalle_Traslado_co_cod, Detalle_Traslado_s_cod) REFERENCES Detalle_Traslado (Compra_co_cod, Traslado_s_cod);
ALTER TABLE Via_Res ADD CONSTRAINT Via_Res_Boleto_Viaje_FK FOREIGN KEY (Boleto_Viaje_co_cod, Boleto_Viaje_s_cod) REFERENCES Boleto_Viaje (Compra_co_cod, Viaje_s_cod);
ALTER TABLE Via_Res ADD CONSTRAINT Via_Res_Entrada_Digital_FK FOREIGN KEY (Entrada_Digital_co_cod, Entrada_Digital_s_cod) REFERENCES Entrada_Digital (Compra_co_cod, Servicio_Adicional_s_cod);
ALTER TABLE Via_Res ADD CONSTRAINT Via_Res_Detalle_Hospedaje_FK FOREIGN KEY (Detalle_Hospedaje_co_cod, Detalle_Hospedaje_s_cod) REFERENCES Detalle_Hospedaje (Compra_co_cod, Habitacion_s_cod);
ALTER TABLE Vuelo ADD CONSTRAINT Vuelo_Aerolinea_FK FOREIGN KEY (Aerolinea_p_cod) REFERENCES Aerolinea (p_cod);
ALTER TABLE Vuelo ADD CONSTRAINT Vuelo_Aeronave_FK FOREIGN KEY (Aeronave_mt_cod) REFERENCES Aeronave (mt_cod);
ALTER TABLE Vuelo ADD CONSTRAINT Vuelo_Lugar_FK FOREIGN KEY (Lugar_l_cod) REFERENCES Lugar (l_cod);
ALTER TABLE Vuelo ADD CONSTRAINT Vuelo_Lugar_FKv2 FOREIGN KEY (Lugar_l_cod2) REFERENCES Lugar (l_cod);
ALTER TABLE Vuelo ADD CONSTRAINT Vuelo_Servicio_FK FOREIGN KEY (s_cod) REFERENCES Servicio (s_cod);

-- ===================================================
-- ALTER - CHECKS
-- ===================================================

ALTER TABLE Cliente ADD CONSTRAINT Check_sexo CHECK(UPPER(c_sexo) IN ('M', 'F'));
ALTER TABLE Cliente ADD CONSTRAINT Check_edo_civil CHECK(UPPER(c_edo_civil) IN ('SOLTERO', 'CASADO'));
ALTER TABLE Cliente ADD CONSTRAINT Check_CI CHECK(c_CI BETWEEN 5000000 AND 150000000);
ALTER TABLE Compra ADD CONSTRAINT Estado_Compra_Check CHECK(UPPER(co_estado) IN ('EN PROCESO', 'PAGANDO', 'FINANCIADO', 'FINALIZADO'));
ALTER TABLE Empleado ADD CONSTRAINT Check_CI CHECK(e_CI BETWEEN 5000000 AND 150000000);
ALTER TABLE Lugar ADD CONSTRAINT Check_tipo_lugar CHECK(UPPER(l_tipo) IN ('CONTINENTE', 'PAIS', 'EDO/PROVINCIA', 'CIUDAD', 'MUNICIPIO', 'PARROQUIA'));
ALTER TABLE Marca ADD CONSTRAINT Check_Tipo_Vehiculo CHECK(UPPER(mav_tipo_vehiculo) IN ('AEREO', 'MARITIMO', 'TERRESTRE'));  
ALTER TABLE Metodo_Pago ADD CONSTRAINT Check_Tipo_Met_Pago CHECK(UPPER(mp_tipo) IN ('TARJETA', 'CHEQUE', 'DEPOSITO', 'OPERACION_DIGITAL', 'USDT', 'MILLA'));
ALTER TABLE Metodo_Pago ADD CONSTRAINT Check_Metodo_Pago_Tarjeta CHECK (
    (mp_tipo = 'TARJETA' AND 
        t_numero IS NOT NULL AND 
        t_cod_seguridad IS NOT NULL AND 
        t_nombre_titular IS NOT NULL AND 
        t_fecha_vencimiento IS NOT NULL AND 
        t_Banco_cod IS NOT NULL AND 
        t_emisor IS NOT NULL AND
        c_codigo_cuenta IS NULL AND c_numero IS NULL AND c_Banco_cod IS NULL AND c_fecha_emision IS NULL AND
        de_num_referencia IS NULL AND de_num_destino IS NULL AND de_Banco_cod IS NULL AND
        od_num_referencia IS NULL AND
        u_hash_id IS NULL AND u_direccion_billetera IS NULL AND
        m_cant_acumulada IS NULL AND m_Cliente_cod IS NULL
    ) 
    OR (mp_tipo <> 'TARJETA')
);

ALTER TABLE Metodo_Pago ADD CONSTRAINT Check_Metodo_Pago_Cheque CHECK (
    (mp_tipo = 'CHEQUE' AND 
        c_codigo_cuenta IS NOT NULL AND 
        c_numero IS NOT NULL AND 
        c_Banco_cod IS NOT NULL AND 
        c_fecha_emision IS NOT NULL AND
		c_nombre_titular IS NOT NULL AND
        t_numero IS NULL AND t_cod_seguridad IS NULL AND t_nombre_titular IS NULL AND t_fecha_vencimiento IS NULL AND t_Banco_cod IS NULL AND t_emisor IS NULL AND
        de_num_referencia IS NULL AND de_num_destino IS NULL AND de_Banco_cod IS NULL AND
        od_num_referencia IS NULL AND
        u_hash_id IS NULL AND u_direccion_billetera IS NULL AND
        m_cant_acumulada IS NULL AND m_Cliente_cod IS NULL
    ) 
    OR (mp_tipo <> 'CHEQUE')
);

ALTER TABLE Metodo_Pago ADD CONSTRAINT Check_Metodo_Pago_Deposito CHECK (
    (mp_tipo = 'DEPOSITO' AND 
        de_num_referencia IS NOT NULL AND 
        de_num_destino IS NOT NULL AND 
        de_Banco_cod IS NOT NULL AND
        t_numero IS NULL AND t_cod_seguridad IS NULL AND t_nombre_titular IS NULL AND t_fecha_vencimiento IS NULL AND t_Banco_cod IS NULL AND t_emisor IS NULL AND
        c_codigo_cuenta IS NULL AND c_numero IS NULL AND c_Banco_cod IS NULL AND c_fecha_emision IS NULL AND
        od_num_referencia IS NULL AND
        u_hash_id IS NULL AND u_direccion_billetera IS NULL AND
        m_cant_acumulada IS NULL AND m_Cliente_cod IS NULL
    ) 
    OR (mp_tipo <> 'DEPOSITO')
);

ALTER TABLE Metodo_Pago ADD CONSTRAINT Check_Metodo_Pago_OpDigital CHECK (
    (mp_tipo = 'OPERACION_DIGITAL' AND 
        od_num_referencia IS NOT NULL AND
        t_numero IS NULL AND t_cod_seguridad IS NULL AND t_nombre_titular IS NULL AND t_fecha_vencimiento IS NULL AND t_Banco_cod IS NULL AND t_emisor IS NULL AND
        c_codigo_cuenta IS NULL AND c_numero IS NULL AND c_Banco_cod IS NULL AND c_fecha_emision IS NULL AND
        de_num_referencia IS NULL AND de_num_destino IS NULL AND de_Banco_cod IS NULL AND
        u_hash_id IS NULL AND u_direccion_billetera IS NULL AND
        m_cant_acumulada IS NULL AND m_Cliente_cod IS NULL
    ) 
    OR (mp_tipo <> 'OPERACION_DIGITAL')
);

ALTER TABLE Metodo_Pago ADD CONSTRAINT Check_Metodo_Pago_USDT CHECK (
    (mp_tipo = 'USDT' AND 
        u_hash_id IS NOT NULL AND 
        u_direccion_billetera IS NOT NULL AND
        t_numero IS NULL AND t_cod_seguridad IS NULL AND t_nombre_titular IS NULL AND t_fecha_vencimiento IS NULL AND t_Banco_cod IS NULL AND t_emisor IS NULL AND
        c_codigo_cuenta IS NULL AND c_numero IS NULL AND c_Banco_cod IS NULL AND c_fecha_emision IS NULL AND
        de_num_referencia IS NULL AND de_num_destino IS NULL AND de_Banco_cod IS NULL AND
        od_num_referencia IS NULL AND
        m_cant_acumulada IS NULL AND m_Cliente_cod IS NULL
    ) 
    OR (mp_tipo <> 'USDT')
);

ALTER TABLE Metodo_Pago ADD CONSTRAINT Check_Metodo_Pago_Milla CHECK (
    (mp_tipo = 'MILLA' AND 
        m_cant_acumulada IS NOT NULL AND 
        m_Cliente_cod IS NOT NULL AND
        t_numero IS NULL AND t_cod_seguridad IS NULL AND t_nombre_titular IS NULL AND t_fecha_vencimiento IS NULL AND t_Banco_cod IS NULL AND t_emisor IS NULL AND
        c_codigo_cuenta IS NULL AND c_numero IS NULL AND c_Banco_cod IS NULL AND c_fecha_emision IS NULL AND
        de_num_referencia IS NULL AND de_num_destino IS NULL AND de_Banco_cod IS NULL AND
        od_num_referencia IS NULL AND
        u_hash_id IS NULL AND u_direccion_billetera IS NULL
    ) 
    OR (mp_tipo <> 'MILLA')
);
ALTER TABLE Promocion ADD CONSTRAINT Proveedor_Check CHECK(
	(Aerolinea_p_cod IS NOT NULL AND Transporte_Terrestre_p_cod IS NULL AND Crucero_p_cod IS NULL AND Operador_Turistico_p_cod IS NULL AND Hotel_p_cod IS NULL) OR
	(Aerolinea_p_cod IS NULL AND Transporte_Terrestre_p_cod IS NOT NULL AND Crucero_p_cod IS NULL AND Operador_Turistico_p_cod IS NULL AND Hotel_p_cod IS NULL) OR
	(Aerolinea_p_cod IS NULL AND Transporte_Terrestre_p_cod IS NULL AND Crucero_p_cod IS NOT NULL AND Operador_Turistico_p_cod IS NULL AND Hotel_p_cod IS NULL) OR
	(Aerolinea_p_cod IS NULL AND Transporte_Terrestre_p_cod IS NULL AND Crucero_p_cod IS NULL AND Operador_Turistico_p_cod IS NOT NULL AND Hotel_p_cod IS NULL) OR
	(Aerolinea_p_cod IS NULL AND Transporte_Terrestre_p_cod IS NULL AND Crucero_p_cod IS NULL AND Operador_Turistico_p_cod IS NULL AND Hotel_p_cod IS NOT NULL)
);
ALTER TABLE Promocion ADD CONSTRAINT Check_Porcentaje CHECK(pr_porcentaje BETWEEN 1 AND 90);
ALTER TABLE Res_Pro_Ser ADD CONSTRAINT Reserva_Check CHECK(
	(Boleto_Vuelo_co_cod IS NOT NULL AND Boleto_Vuelo_s_cod IS NOT NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NOT NULL AND Detalle_Traslado_s_cod IS NOT NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NOT NULL AND Boleto_Viaje_s_cod IS NOT NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NOT NULL AND Entrada_Digital_s_cod IS NOT NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NOT NULL AND Detalle_Hospedaje_s_cod IS NOT NULL)
);
ALTER TABLE Reembolso ADD CONSTRAINT Reserva_Check CHECK(
	(Boleto_Vuelo_co_cod IS NOT NULL AND Boleto_Vuelo_s_cod IS NOT NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NOT NULL AND Detalle_Traslado_s_cod IS NOT NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NOT NULL AND Boleto_Viaje_s_cod IS NOT NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NOT NULL AND Entrada_Digital_s_cod IS NOT NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NOT NULL AND Detalle_Hospedaje_s_cod IS NOT NULL)
);
ALTER TABLE Queja ADD CONSTRAINT Reserva_Check CHECK(
	(Boleto_Vuelo_co_cod IS NOT NULL AND Boleto_Vuelo_s_cod IS NOT NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NOT NULL AND Detalle_Traslado_s_cod IS NOT NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NOT NULL AND Boleto_Viaje_s_cod IS NOT NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NOT NULL AND Entrada_Digital_s_cod IS NOT NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NOT NULL AND Detalle_Hospedaje_s_cod IS NOT NULL)	
);
ALTER TABLE Resena ADD CONSTRAINT Check_Porcentaje CHECK(r_calificacion BETWEEN 0 AND 10);
ALTER TABLE Resena ADD CONSTRAINT Reserva_Check CHECK(
	(Boleto_Vuelo_co_cod IS NOT NULL AND Boleto_Vuelo_s_cod IS NOT NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NOT NULL AND Detalle_Traslado_s_cod IS NOT NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NOT NULL AND Boleto_Viaje_s_cod IS NOT NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NOT NULL AND Entrada_Digital_s_cod IS NOT NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NOT NULL AND Detalle_Hospedaje_s_cod IS NOT NULL)	
);
ALTER TABLE Restaurante ADD CONSTRAINT Check_calificacion CHECK(re_calificacion BETWEEN 0 AND 5);
ALTER TABLE Telefono ADD CONSTRAINT Telefono_Check CHECK (
	(Cliente_c_cod IS NOT NULL AND Operador_Turistico_p_cod IS NULL) OR 
	(Operador_Turistico_p_cod IS NOT NULL AND Cliente_c_cod IS NULL)
);
ALTER TABLE Tasa_Cambio ADD CONSTRAINT Divisa_Check CHECK(tca_divisa_origen IN ('EUR', 'USD', 'JPY', 'MILLA'));
ALTER TABLE Usuario ADD CONSTRAINT Usuario_Check CHECK (
	(Cliente_c_cod IS NOT NULL AND Empleado_e_cod IS NULL AND Aerolinea_p_cod IS NULL AND Transporte_Terrestre_p_cod IS NULL AND Crucero_p_cod IS NULL AND Operador_Turistico_p_cod IS NULL AND Hotel_p_cod IS NULL) OR
	(Cliente_c_cod IS NULL AND Empleado_e_cod IS NOT NULL AND Aerolinea_p_cod IS NULL AND Transporte_Terrestre_p_cod IS NULL AND Crucero_p_cod IS NULL AND Operador_Turistico_p_cod IS NULL AND Hotel_p_cod IS NULL) OR
	(Cliente_c_cod IS NULL AND Empleado_e_cod IS NULL AND Aerolinea_p_cod IS NOT NULL AND Transporte_Terrestre_p_cod IS NULL AND Crucero_p_cod IS NULL AND Operador_Turistico_p_cod IS NULL AND Hotel_p_cod IS NULL) OR
	(Cliente_c_cod IS NULL AND Empleado_e_cod IS NULL AND Aerolinea_p_cod IS NULL AND Transporte_Terrestre_p_cod IS NOT NULL AND Crucero_p_cod IS NULL AND Operador_Turistico_p_cod IS NULL AND Hotel_p_cod IS NULL) OR
	(Cliente_c_cod IS NULL AND Empleado_e_cod IS NULL AND Aerolinea_p_cod IS NULL AND Transporte_Terrestre_p_cod IS NULL AND Crucero_p_cod IS NOT NULL AND Operador_Turistico_p_cod IS NULL AND Hotel_p_cod IS NULL) OR
	(Cliente_c_cod IS NULL AND Empleado_e_cod IS NULL AND Aerolinea_p_cod IS NULL AND Transporte_Terrestre_p_cod IS NULL AND Crucero_p_cod IS NULL AND Operador_Turistico_p_cod IS NOT NULL AND Hotel_p_cod IS NULL) OR
	(Cliente_c_cod IS NULL AND Empleado_e_cod IS NULL AND Aerolinea_p_cod IS NULL AND Transporte_Terrestre_p_cod IS NULL AND Crucero_p_cod IS NULL AND Operador_Turistico_p_cod IS NULL AND Hotel_p_cod IS NOT NULL)
);
ALTER TABLE Via_Res ADD CONSTRAINT Reserva_Check CHECK(
	(Boleto_Vuelo_co_cod IS NOT NULL AND Boleto_Vuelo_s_cod IS NOT NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NOT NULL AND Detalle_Traslado_s_cod IS NOT NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NOT NULL AND Boleto_Viaje_s_cod IS NOT NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NOT NULL AND Entrada_Digital_s_cod IS NOT NULL AND Detalle_Hospedaje_co_cod IS NULL AND Detalle_Hospedaje_s_cod IS NULL) OR
	(Boleto_Vuelo_co_cod IS NULL AND Boleto_Vuelo_s_cod IS NULL AND Detalle_Traslado_co_cod IS NULL AND Detalle_Traslado_s_cod IS NULL AND Boleto_Viaje_co_cod IS NULL AND Boleto_Viaje_s_cod IS NULL AND Entrada_Digital_co_cod IS NULL AND Entrada_Digital_s_cod IS NULL AND Detalle_Hospedaje_co_cod IS NOT NULL AND Detalle_Hospedaje_s_cod IS NOT NULL)
);

-- ===================================================
-- TRIGGERS
-- ===================================================

CREATE OR REPLACE FUNCTION fn_generar_nota_credito()
	RETURNS TRIGGER AS $$
	DECLARE
	    v_costo_base NUMERIC(10, 2);
	    v_cliente_cod INT;
	    v_nuevo_mp_cod INT;
	    v_monto_final NUMERIC(10, 2);
	BEGIN	    
	    -- Boleto Vuelo
	    IF NEW.Boleto_Vuelo_co_cod IS NOT NULL THEN
	        -- Actualizar el estado a Anulado
	        UPDATE Boleto_Vuelo 
	        SET res_anulado = TRUE 
	        WHERE compra_co_cod = NEW.Boleto_Vuelo_co_cod 
	          AND vuelo_s_cod = NEW.Boleto_Vuelo_s_cod;
	
	        -- Obtener datos para el reembolso
	        SELECT bv.res_costo_sub_total, c.cliente_c_cod
	        INTO v_costo_base, v_cliente_cod
	        FROM Boleto_Vuelo bv
	        JOIN Compra c ON bv.compra_co_cod = c.co_cod
	        WHERE bv.compra_co_cod = NEW.Boleto_Vuelo_co_cod 
	          AND bv.vuelo_s_cod = NEW.Boleto_Vuelo_s_cod;
	          
	    -- Detalle Traslado
	    ELSIF NEW.Detalle_Traslado_co_cod IS NOT NULL THEN
	        UPDATE Detalle_Traslado 
	        SET res_anulado = TRUE 
	        WHERE compra_co_cod = NEW.Detalle_Traslado_co_cod 
	          AND traslado_s_cod = NEW.Detalle_Traslado_s_cod;
	
	        SELECT dt.res_costo_sub_total, c.cliente_c_cod
	        INTO v_costo_base, v_cliente_cod
	        FROM Detalle_Traslado dt
	        JOIN Compra c ON dt.compra_co_cod = c.co_cod
	        WHERE dt.compra_co_cod = NEW.Detalle_Traslado_co_cod 
	          AND dt.traslado_s_cod = NEW.Detalle_Traslado_s_cod;
	
	    -- Boleto Viaje (Crucero)
	    ELSIF NEW.Boleto_Viaje_co_cod IS NOT NULL THEN
	        UPDATE Boleto_Viaje 
	        SET res_anulado = TRUE 
	        WHERE compra_co_cod = NEW.Boleto_Viaje_co_cod 
	          AND viaje_s_cod = NEW.Boleto_Viaje_s_cod;
	
	        SELECT bvi.res_costo_sub_total, c.cliente_c_cod
	        INTO v_costo_base, v_cliente_cod
	        FROM Boleto_Viaje bvi
	        JOIN Compra c ON bvi.compra_co_cod = c.co_cod
	        WHERE bvi.compra_co_cod = NEW.Boleto_Viaje_co_cod 
	          AND bvi.viaje_s_cod = NEW.Boleto_Viaje_s_cod;
	
	    -- Entrada Digital
	    ELSIF NEW.Entrada_Digital_co_cod IS NOT NULL THEN
	        UPDATE Entrada_Digital 
	        SET res_anulado = TRUE 
	        WHERE compra_co_cod = NEW.Entrada_Digital_co_cod 
	          AND servicio_adicional_s_cod = NEW.Entrada_Digital_s_cod;
	
	        SELECT ed.res_costo_sub_total, c.cliente_c_cod
	        INTO v_costo_base, v_cliente_cod
	        FROM Entrada_Digital ed
	        JOIN Compra c ON ed.compra_co_cod = c.co_cod
	        WHERE ed.compra_co_cod = NEW.Entrada_Digital_co_cod 
	          AND ed.servicio_adicional_s_cod = NEW.Entrada_Digital_s_cod;
	
	    -- Detalle Hospedaje
	    ELSIF NEW.Detalle_Hospedaje_co_cod IS NOT NULL THEN
	        UPDATE Detalle_Hospedaje 
	        SET res_anulado = TRUE 
	        WHERE compra_co_cod = NEW.Detalle_Hospedaje_co_cod 
	          AND habitacion_s_cod = NEW.Detalle_Hospedaje_s_cod;
	
	        SELECT dh.res_costo_sub_total, c.cliente_c_cod
	        INTO v_costo_base, v_cliente_cod
	        FROM Detalle_Hospedaje dh
	        JOIN Compra c ON dh.compra_co_cod = c.co_cod
	        WHERE dh.compra_co_cod = NEW.Detalle_Hospedaje_co_cod 
	          AND dh.habitacion_s_cod = NEW.Detalle_Hospedaje_s_cod;
	    END IF;
	
	    -- CALCULAR MONTO (90%)
	    v_monto_final := v_costo_base * 0.90;
	
	    -- CREAR NUEVO MÉTODO DE PAGO (Operación Digital)
	    INSERT INTO Metodo_Pago (
	        mp_tipo, 
	        Cliente_c_cod, 
	        od_num_referencia
	    ) VALUES (
	        'OPERACION_DIGITAL',
	        v_cliente_cod,
	        (floor(random() * 900000000 + 100000000)::bigint)
	    )
	    RETURNING mp_cod INTO v_nuevo_mp_cod;
	
	    -- INSERTAR LA NOTA DE CRÉDITO
	    INSERT INTO Nota_Credito (
	        nc_monto_devuelto, 
	        reembolso_ree_cod, 
	        metodo_pago_mp_cod
	    ) VALUES (
	        v_monto_final,
	        NEW.ree_cod,
	        v_nuevo_mp_cod
	    );
	
	    RETURN NEW;
	END;
	$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trg_crear_nota_credito_post_reembolso
AFTER INSERT ON Reembolso
FOR EACH ROW
EXECUTE FUNCTION fn_generar_nota_credito();

-- Trigger automatico para las millas de los clientes
CREATE OR REPLACE FUNCTION fn_crear_pago_millas()
	RETURNS TRIGGER 
	AS $$
	BEGIN
	    -- Crear Millas asociadas al Cliente.
	    INSERT INTO Metodo_Pago (Cliente_c_cod, m_cant_acumulada, m_Cliente_cod, mp_tipo)
	    VALUES (NEW.c_cod, 0, NEW.c_cod, 'MILLA'); 
	    RETURN NEW;
	END;
	$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER tr_nuevo_cliente_millas
AFTER INSERT ON Cliente
FOR EACH ROW
EXECUTE FUNCTION fn_crear_pago_millas();

-- ===================================================
-- CREATE - STORE PROCEDURES / FUNCIONES
-- ===================================================

