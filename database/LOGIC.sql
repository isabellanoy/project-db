-- ===================================================
-- STORE PROCEDURES Y FUNCIONES
-- ===================================================

-- Listar todos los lugares con su información de jerarquía
CREATE OR REPLACE FUNCTION fn_buscar_lugares(
    p_limite INT DEFAULT 100,
    p_offset INT DEFAULT 0
)
	RETURNS TABLE (
		COD INT,
		Nombre VARCHAR,
		Tipo VARCHAR,
		Origen VARCHAR
	)
	AS $$
		SELECT l.l_cod, l.l_nombre, l.l_tipo,
			CASE 
				WHEN l.Lugar_l_cod IS NULL THEN '-'
				ELSE (SELECT l2.l_nombre FROM Lugar l2 WHERE l2.l_cod = l.Lugar_l_cod)
			END AS padre_nombre
		FROM Lugar l
		LIMIT p_limite
		OFFSET p_offset;
	$$ LANGUAGE SQL;

-- Validar si un lugar existe
CREATE OR REPLACE FUNCTION fn_existe_lugar(p_lugar_cod INT)
	RETURNS BOOLEAN AS $$
	BEGIN
	    RETURN EXISTS(SELECT 1 FROM Lugar WHERE l_cod = p_lugar_cod);
	END;
	$$ LANGUAGE plpgsql;

-- Listar los descendientes inmediatos de un lugar
CREATE OR REPLACE FUNCTION fn_buscar_hijos_lugar(p_lugar_cod INT)
	RETURNS TABLE (
		cod INT,
		Nombre VARCHAR,
		Tipo VARCHAR
	)
	LANGUAGE plpgsql
	AS $$
	BEGIN
		RETURN QUERY SELECT l.l_cod, l.l_nombre, l.l_tipo
		FROM Lugar l
		WHERE l.lugar_l_cod = p_lugar_cod;
	END;
	$$;	

-- Obtener un lugar por nombre
CREATE OR REPLACE FUNCTION fn_buscar_lugar_por_nombre(p_nombre VARCHAR, p_tipo VARCHAR)
	RETURNS TABLE (
		cod INT,
		nombre VARCHAR,
		tipo VARCHAR,
		origen VARCHAR
	)
	LANGUAGE plpgsql
	AS $$
	BEGIN
		RETURN QUERY SELECT l.l_cod, l.l_nombre, l.l_tipo, l2.l_nombre
		FROM Lugar l, Lugar l2
		WHERE LOWER(l.l_nombre) LIKE LOWER('%' || p_nombre || '%') AND LOWER(l.l_tipo) = LOWER(l_tipo) AND l2.l_cod = l.lugar_l_cod;
	END;
	$$;

-- ===================================================
-- CRUD PARA TABLA AEROLINEA
-- ===================================================

-- Procedure CREATE: Insertar nueva aerolínea
CREATE OR REPLACE PROCEDURE sp_crear_aerolinea(
    IN p_nombre_new VARCHAR,
    IN p_fecha_constitucion DATE,
    IN p_lugar_cod INT,
	OUT p_cod_nuevo INT
)
	LANGUAGE plpgsql
	AS $$
	BEGIN
	    -- Validar que el lugar existe
	    IF NOT fn_existe_lugar(p_lugar_cod) THEN
	        RAISE EXCEPTION 'El lugar con código % no existe', p_lugar_cod;
	    END IF;
	    
	    -- Validar que el nombre no esté vacío
	    IF TRIM(p_nombre_new) = '' THEN
	        RAISE EXCEPTION 'El nombre de la aerolínea no puede estar vacío';
	    END IF;
	    
	    -- Validar que la fecha de constitución no sea mayor a la fecha actual
	    IF p_fecha_constitucion > CURRENT_DATE THEN
	        RAISE EXCEPTION 'La fecha de constitución no puede ser mayor a hoy';
	    END IF;
	    
	    -- Insertar la nueva aerolínea
	    INSERT INTO Aerolinea(p_nombre, p_fecha_afiliacion, a_fecha_constitucion, Lugar_l_cod)
	    VALUES(p_nombre_new, CURRENT_DATE, p_fecha_constitucion, p_lugar_cod)
	    RETURNING Aerolinea.p_cod INTO p_cod_nuevo;
	    
	    RAISE NOTICE 'Aerolínea creada exitosamente con código: %', p_cod_nuevo;
	END;
	$$;

-- Procedure READ: Obtener aerolínea por ID
CREATE OR REPLACE PROCEDURE sp_obtener_aerolinea_por_id(
    IN p_aerolinea_cod INT,
	OUT COD INT,
	OUT Nombre VARCHAR,
	OUT Fecha_Afiliacion DATE,
	OUT Fecha_Constitucion DATE,
	OUT Lugar_Origen INT
)
	LANGUAGE plpgsql
	AS $$
	BEGIN
	    SELECT 
	        a.p_cod,
	        a.p_nombre,
	        a.p_fecha_afiliacion,
	        a.a_fecha_constitucion,
	        l.l_cod
		INTO COD, Nombre, Fecha_Afiliacion, Fecha_Constitucion, Lugar_Origen
	    FROM Aerolinea a
	    LEFT JOIN Lugar l ON a.Lugar_l_cod = l.l_cod
	    WHERE a.p_cod = p_aerolinea_cod;
	    
	    IF NOT FOUND THEN
	        RAISE NOTICE 'No se encontró aerolínea con código %', p_aerolinea_cod;
	    END IF;
	END;
	$$;

-- Procedure READ: Buscar aerolíneas por nombre
CREATE OR REPLACE FUNCTION fn_buscar_aerolinea_por_nombre(
    IN p_nombre_patron VARCHAR,
    IN p_limite INT DEFAULT 50,
    IN p_offset INT DEFAULT 0
)
	RETURNS TABLE (
		COD INT,
		Nombre VARCHAR,
		Fecha_Afiliacion DATE,
		Fecha_Constitucion DATE,
		Lugar_Origen VARCHAR
	)
	LANGUAGE plpgsql
	AS $$
	BEGIN
	    RETURN QUERY(
		SELECT 
	        a.p_cod,
	        a.p_nombre,
	        a.p_fecha_afiliacion,
	        a.a_fecha_constitucion,
	        l.l_nombre
	    FROM Aerolinea a
	    LEFT JOIN Lugar l ON a.Lugar_l_cod = l.l_cod
	    WHERE LOWER(a.p_nombre) LIKE LOWER('%' || p_nombre_patron || '%')
	    ORDER BY a.p_nombre
	    LIMIT p_limite
	    OFFSET p_offset
		);
	END;
	$$;

-- Funcion READ: Buscar todas las aerolineas
CREATE OR REPLACE FUNCTION fn_buscar_aerolineas()
	RETURNS TABLE (
		COD INT,
		Nombre VARCHAR,
		Fecha_Afiliacion DATE,
		Fecha_Constitucion DATE,
		Lugar_Origen INT
	)
	AS $$
		SELECT p_cod, p_nombre, p_fecha_afiliacion, a_fecha_constitucion, Lugar_l_cod 
		FROM Aerolinea;
	$$ LANGUAGE SQL;
	
-- Procedure UPDATE: Actualizar aerolínea con actualizaciones parciales
CREATE OR REPLACE PROCEDURE sp_actualizar_aerolinea(
	OUT p_registros_actualizados INT,
	IN p_aerolinea_cod INT,
    IN p_nombre_new VARCHAR DEFAULT NULL,
    IN p_fecha_afiliacion_new DATE DEFAULT NULL,
    IN p_fecha_constitucion DATE DEFAULT NULL,
    IN p_lugar_cod INT DEFAULT NULL
)
	LANGUAGE plpgsql
	AS $$
	DECLARE
	    v_aerolinea_existe INT;
	BEGIN
	    -- Validar que la aerolínea existe
	    SELECT a.p_cod INTO v_aerolinea_existe
	    FROM Aerolinea a
	    WHERE a.p_cod = p_aerolinea_cod;
	    
	    IF v_aerolinea_existe IS NULL THEN
	        RAISE EXCEPTION 'La aerolínea con código % no existe', p_aerolinea_cod;
	    END IF;
	    
	    -- Si se proporciona un nuevo lugar, validar que existe
	    IF p_lugar_cod IS NOT NULL THEN
	        IF NOT fn_existe_lugar(p_lugar_cod) THEN
	            RAISE EXCEPTION 'El lugar con código % no existe', p_lugar_cod;
	        END IF;
	    END IF;
	    
	    -- Validar que el nombre no sea vacío si se intenta actualizar
	    IF p_nombre_new IS NOT NULL AND TRIM(p_nombre_new) = '' THEN
	        RAISE EXCEPTION 'El nombre de la aerolínea no puede estar vacío';
	    END IF;
	    
	    -- Validar fecha de constitución si se proporciona
	    IF p_fecha_constitucion IS NOT NULL AND p_fecha_constitucion > CURRENT_DATE THEN
	        RAISE EXCEPTION 'La fecha de constitución no puede ser mayor a hoy';
	    END IF;
	    
	    -- Actualizar sólo los campos proporcionados (actualizaciones parciales)
	    UPDATE Aerolinea
	    SET 
	        p_nombre = COALESCE(p_nombre_new, p_nombre),
	        p_fecha_afiliacion = COALESCE(p_fecha_afiliacion_new, p_fecha_afiliacion),
	        a_fecha_constitucion = COALESCE(p_fecha_constitucion, a_fecha_constitucion),
	        Lugar_l_cod = COALESCE(p_lugar_cod, Lugar_l_cod)
	    WHERE p_cod = p_aerolinea_cod;
	    
	    GET DIAGNOSTICS p_registros_actualizados = ROW_COUNT;
	    
	    IF p_registros_actualizados > 0 THEN
	        RAISE NOTICE 'Aerolínea actualizada exitosamente. % registro(s) afectado(s)', p_registros_actualizados;
	    ELSE
	        RAISE NOTICE 'No se realizó ninguna actualización';
	    END IF;
	END;
	$$;

-- Procedure DELETE: Eliminar aerolínea por ID
CREATE OR REPLACE PROCEDURE sp_eliminar_aerolinea(
    IN p_aerolinea_cod INT,
    OUT p_eliminada BOOLEAN,
    OUT p_mensaje VARCHAR
)
	LANGUAGE plpgsql
	AS $$
	DECLARE
	    v_aerolinea_existe INT;
	    v_cant_aeronaves INT;
	    v_cant_referencias INT;
	BEGIN
	    -- Validar que la aerolínea existe
	    SELECT a.p_cod INTO v_aerolinea_existe
	    FROM Aerolinea a
	    WHERE a.p_cod = p_aerolinea_cod;
	    
	    IF v_aerolinea_existe IS NULL THEN
	        p_eliminada := FALSE;
	        p_mensaje := 'La aerolínea con código ' || p_aerolinea_cod || ' no existe';
	        RETURN;
	    END IF;
	    
	    -- Contar aeronaves asociadas
	    SELECT COUNT(*) INTO v_cant_aeronaves
	    FROM Aeronave
	    WHERE Aerolinea_p_cod = p_aerolinea_cod;
	    
	    -- Contar otras referencias en la base de datos
	    SELECT COUNT(*) INTO v_cant_referencias
	    FROM Promocion
	    WHERE Aerolinea_p_cod = p_aerolinea_cod;
	    
	    -- Si hay referencias, no permitir eliminación
	    IF v_cant_aeronaves > 0 OR v_cant_referencias > 0 THEN
	        p_eliminada := FALSE;
	        p_mensaje := 'No se puede eliminar la aerolínea. Tiene ' || v_cant_aeronaves || 
	                     ' aeronave(s) y ' || v_cant_referencias || ' promoción(es) asociada(s)';
	        RETURN;
	    END IF;
	    
	    -- Proceder con la eliminación
	    DELETE FROM Aerolinea
	    WHERE p_cod = p_aerolinea_cod;
	    
	    p_eliminada := TRUE;
	    p_mensaje := 'Aerolínea eliminada exitosamente';
	END;
	$$;

-- ============================================================================
-- STORE PROCEDURES Y FUNCIONES PARA AUTENTICACIÓN Y GESTIÓN DE USUARIOS
-- ============================================================================

-- Función para validar si un email ya existe
CREATE OR REPLACE FUNCTION fn_email_existe(p_correo VARCHAR)
	RETURNS BOOLEAN AS $$
	BEGIN
	    RETURN EXISTS(SELECT 1 FROM Usuario WHERE u_correo = p_correo);
	END;
	$$ LANGUAGE plpgsql;

-- Función para validar si un username ya existe
CREATE OR REPLACE FUNCTION fn_username_existe(p_username VARCHAR)
	RETURNS BOOLEAN AS $$
	BEGIN
	    RETURN EXISTS(SELECT 1 FROM Usuario WHERE u_username = p_username);
	END;
	$$ LANGUAGE plpgsql;

-- Función para validar si una cédula ya existe
CREATE OR REPLACE FUNCTION fn_cliente_existe_por_ci(p_ci INT)
	RETURNS BOOLEAN AS $$
	BEGIN
	    RETURN EXISTS(SELECT 1 FROM Cliente WHERE c_CI = p_ci);
	END;
	$$ LANGUAGE plpgsql;

-- Registro del cliente
CREATE OR REPLACE PROCEDURE sp_registrar_cliente(
    p_username VARCHAR,
    p_correo VARCHAR,
    p_clave VARCHAR,
    p_ci INT,
    p_primer_nombre VARCHAR,
    p_segundo_nombre VARCHAR,
    p_primer_apellido VARCHAR,
    p_segundo_apellido VARCHAR,
    p_fecha_nacimiento DATE,
    p_sexo CHAR,
    p_estado_civil VARCHAR,
	p_direccion VARCHAR,
	p_lugar_cod INT,
    OUT p_cliente_cod INT,
    OUT p_usuario_cod INT,
    OUT p_mensaje VARCHAR
)
	LANGUAGE plpgsql
	AS $$
	DECLARE
	    v_rol_cliente INT;
	    v_cliente_cod INT;
	    v_usuario_cod INT;
	BEGIN
	    p_mensaje := 'OK';
	    
	    -- Validaciones iniciales
		IF NOT fn_existe_lugar(p_lugar_cod) THEN
	        p_mensaje := 'ERROR: El lugar indicado no existe';
	        RAISE EXCEPTION '%', p_mensaje;
	    END IF;
		
		IF fn_email_existe(p_correo) THEN
	        p_mensaje := 'ERROR: El email ya está registrado';
	        RAISE EXCEPTION '%', p_mensaje;
	    END IF;
	    
	    IF fn_username_existe(p_username) THEN
	        p_mensaje := 'ERROR: El username ya está registrado';
	        RAISE EXCEPTION '%', p_mensaje;
	    END IF;
	    
	    IF fn_cliente_existe_por_ci(p_ci) THEN
	        p_mensaje := 'ERROR: Ya existe un cliente registrado con esta cédula';
	        RAISE EXCEPTION '%', p_mensaje;
	    END IF;
	    
	    -- Validar edad mínima (debe ser mayor de 18 años)
	    IF (CURRENT_DATE - p_fecha_nacimiento) < 6570 THEN -- 6570 dias son 18 años
	        p_mensaje := 'ERROR: Debes ser mayor de 18 años para registrarte';
	        RAISE EXCEPTION '%', p_mensaje;
	    END IF;
	    
	    -- Obtener rol de Cliente (asumiendo que existe en la tabla Rol)
	    SELECT ro_cod INTO v_rol_cliente FROM Rol WHERE ro_nombre = 'Cliente' LIMIT 1;
	    
	    IF v_rol_cliente IS NULL THEN
	        p_mensaje := 'ERROR: Rol de Cliente no encontrado en el sistema';
	        RAISE EXCEPTION '%', p_mensaje;
	    END IF;
	    	    
	    BEGIN
	        -- Crear Cliente
	        INSERT INTO Cliente (c_CI, c_p_nombre, c_s_nombre, c_p_apellido, c_s_apellido, c_fecha_nacimiento, c_sexo, c_edo_civil, c_direccion, lugar_l_cod) 
			VALUES (
	            p_ci,
	            p_primer_nombre,
	            p_segundo_nombre,
	            p_primer_apellido,
	            p_segundo_apellido,
	            p_fecha_nacimiento,
	            p_sexo,
	            p_estado_civil,
				p_direccion,
				p_lugar_cod
	        ) RETURNING c_cod INTO v_cliente_cod;
	        
	        p_cliente_cod := v_cliente_cod;
	        
	        -- Crear Usuario
	        INSERT INTO Usuario (u_username, u_correo, u_hash_clave, Rol_ro_cod, Cliente_c_cod) 
			VALUES (
	            p_username,
	            p_correo,
	            p_clave,
	            v_rol_cliente,
	            v_cliente_cod
	        ) RETURNING u_cod INTO v_usuario_cod;
	        
	        p_usuario_cod := v_usuario_cod;     
	        p_mensaje := 'Cliente registrado exitosamente';
	        
	    EXCEPTION WHEN OTHERS THEN
	        p_mensaje := 'ERROR: ' || SQLERRM;
	        RAISE;
	    END;   
	END;
	$$;

-- LOGIN: Validar credenciales y retornar información del usuario
CREATE OR REPLACE PROCEDURE sp_login_usuario(
    p_username_o_email VARCHAR,
    p_clave VARCHAR,
    OUT p_usuario_cod INT,
    OUT p_username VARCHAR,
    OUT p_mensaje VARCHAR
)
	LANGUAGE plpgsql
	AS $$
	DECLARE
	    v_usuario_record RECORD;
	BEGIN
	    p_mensaje := 'OK';
	    
	    -- Buscar usuario por username o email
	    SELECT u.u_cod, u.u_username, u.u_correo, u.u_hash_clave, 
	           r.ro_nombre
	    INTO v_usuario_record
	    FROM Usuario u
	    INNER JOIN Rol r ON u.Rol_ro_cod = r.ro_cod
	    WHERE u.u_username = p_username_o_email OR u.u_correo = p_username_o_email
	    LIMIT 1;
	    
	    -- Validar que el usuario existe
	    IF v_usuario_record IS NULL THEN
	        p_mensaje := 'ERROR: Usuario no encontrado';
	        RETURN;
	    END IF;
	    
	    -- Verificar la clave usando crypt -- Se puede cambiar a otra cosa
	    IF p_clave = v_usuario_record.u_hash_clave THEN
	        p_usuario_cod := v_usuario_record.u_cod;
	        p_username := v_usuario_record.u_username;
	        p_mensaje := 'Login exitoso';
	    ELSE
	        p_mensaje := 'ERROR: Clave incorrecta';
	    END IF;  
	END;
	$$;

-- OBTENER INFORMACIÓN COMPLETA DEL CLIENTE
CREATE OR REPLACE PROCEDURE sp_obtener_cliente_por_usuario(
    p_usuario_cod INT,
    OUT p_cliente_cod INT,
    OUT p_ci INT,
    OUT p_nombre_completo VARCHAR,
    OUT p_correo VARCHAR,
    OUT p_fecha_nacimiento DATE,
    OUT p_sexo CHAR,
    OUT p_estado_civil VARCHAR,
	OUT p_direccion VARCHAR,
    OUT p_millas_disponibles BIGINT
)
	LANGUAGE plpgsql
	AS $$
	BEGIN
	    SELECT 
	        c.c_cod,
	        c.c_CI,
	        CONCAT(c.c_p_nombre, ' ', COALESCE(c.c_s_nombre, ''), ' ', 
	               c.c_p_apellido, ' ', COALESCE(c.c_s_apellido, '')),
	        u.u_correo,
	        c.c_fecha_nacimiento,
	        c.c_sexo,
	        c.c_edo_civil,
			c.c_direccion,
	        COALESCE(mp.m_cant_acumulada, 0)
	    INTO 
	        p_cliente_cod,
	        p_ci,
	        p_nombre_completo,
	        p_correo,
	        p_fecha_nacimiento,
	        p_sexo,
	        p_estado_civil,
			p_direccion,
	        p_millas_disponibles
	    FROM Usuario u
	    INNER JOIN Cliente c ON u.Cliente_c_cod = c.c_cod
	    LEFT JOIN Metodo_Pago mp ON c.c_cod = mp.m_Cliente_cod
	    WHERE u.u_cod = p_usuario_cod;
	END;
	$$;

-- VALIDAR PERMISOS DEL USUARIO
CREATE OR REPLACE FUNCTION fn_validar_permiso_usuario(
    p_usuario_cod INT,
    p_rol_requerido VARCHAR
)
	RETURNS BOOLEAN AS $$
	BEGIN
	    RETURN EXISTS(
	        SELECT 1 FROM Usuario u
	        INNER JOIN Rol r ON u.Rol_ro_cod = r.ro_cod
	        WHERE u.u_cod = p_usuario_cod AND r.ro_nombre = p_rol_requerido
	    );
	END;
	$$ LANGUAGE plpgsql;

-- CAMBIAR CONTRASEÑA
CREATE OR REPLACE PROCEDURE sp_cambiar_clave_usuario(
    p_usuario_cod INT,
    p_clave_actual VARCHAR,
    p_clave_nueva VARCHAR,
    OUT p_mensaje VARCHAR
)
	LANGUAGE plpgsql
	AS $$
	DECLARE
	    v_hash_actual VARCHAR;
	BEGIN
	    p_mensaje := 'OK';
	    
	    -- Obtener hash actual
	    SELECT u_hash_clave INTO v_hash_actual FROM Usuario WHERE u_cod = p_usuario_cod;
	    
	    IF v_hash_actual IS NULL THEN
	        p_mensaje := 'ERROR: Usuario no encontrado';
	        RETURN;
	    END IF;
	    
	    -- Verificar clave actual
	    IF p_clave_actual != v_hash_actual THEN
	        p_mensaje := 'ERROR: Clave actual incorrecta';
	        RETURN;
	    END IF;
	    
	    -- Validar que la nueva clave sea diferente
	    IF p_clave_actual = p_clave_nueva THEN
	        p_mensaje := 'ERROR: La nueva clave debe ser diferente a la actual';
	        RETURN;
	    END IF;
	    
	    -- Actualizar clave
	    UPDATE Usuario 
	    SET u_hash_clave = p_clave_nueva
	    WHERE u_cod = p_usuario_cod;
	    
	    p_mensaje := 'Clave actualizada exitosamente';
	    
	END;
	$$;

-- ============================================================================
-- STORE PROCEDURES Y FUNCIONES - GESTIÓN DE ROLES Y PERMISOS
-- ============================================================================

-- LISTAR TODOS LOS ROLES CON CANTIDAD DE PERMISOS
CREATE OR REPLACE FUNCTION fn_listar_todos_roles()
	RETURNS TABLE (
	    COD INT,
	    Nombre_Rol VARCHAR,
	    Cantidad_Permisos INT,
	    Descripcion_Permisos TEXT
	) AS $$
	BEGIN
	    RETURN QUERY
	    SELECT 
	        r.ro_cod,
	        r.ro_nombre,
	        COALESCE(COUNT(rp.Permiso_pe_cod)::INT, 0::INT) AS Cantidad_Permisos,
	        COALESCE(
	            STRING_AGG(p.pe_nombre, ', ' ORDER BY p.pe_nombre),
	            'Sin permisos asignados'
	        )::TEXT AS Descripcion_Permisos
	    FROM Rol r
	    LEFT JOIN Rol_Per rp ON r.ro_cod = rp.Rol_ro_cod
	    LEFT JOIN Permiso p ON rp.Permiso_pe_cod = p.pe_cod
	    GROUP BY r.ro_cod, r.ro_nombre
	    ORDER BY r.ro_nombre;
	END;
	$$ LANGUAGE plpgsql;

-- OBTENER UN ROL PARTICULAR CON TODOS SUS PERMISOS
CREATE OR REPLACE FUNCTION fn_obtener_rol_con_permisos(
    p_id_rol INT
)
	RETURNS TABLE (
	    exito BOOLEAN,
	    codigo_error INT,
	    mensaje VARCHAR,
	    id_rol INT,
	    nombre_rol VARCHAR,
	    cantidad_permisos INT,
	    permisos_json JSON
	) AS $$
	DECLARE
	    v_rol_existe BOOLEAN;
	    v_permisos_json JSON;
	BEGIN
	    -- Verificar que el rol existe
	    SELECT EXISTS(SELECT 1 FROM Rol WHERE ro_cod = p_id_rol)
	    INTO v_rol_existe;
	
	    IF NOT v_rol_existe THEN
	        RETURN QUERY
	        SELECT 
	            FALSE::BOOLEAN,
	            1::INT,
	            'El rol especificado no existe'::VARCHAR,
	            NULL::INT,
	            NULL::VARCHAR,
	            NULL::INT,
	            NULL::JSON;
	        RETURN;
	    END IF;
	
	    -- Obtener permisos del rol en formato JSON
	    SELECT COALESCE(
	        JSON_AGG(
	            JSON_BUILD_OBJECT(
	                'id_permiso', p.pe_cod,
	                'nombre_permiso', p.pe_nombre,
	                'tipo_permiso', p.pe_tipo
	            ) ORDER BY p.pe_nombre
	        ),
	        '[]'::JSON
	    )
	    INTO v_permisos_json
	    FROM Rol_Per rp
	    LEFT JOIN Permiso p ON rp.Permiso_pe_cod = p.pe_cod
	    WHERE rp.Rol_ro_cod = p_id_rol;
	
	    -- Retornar resultado exitoso
	    RETURN QUERY
	    SELECT 
	        TRUE::BOOLEAN,
	        0::INT,
	        'Rol obtenido exitosamente'::VARCHAR,
	        r.ro_cod::INT,
	        r.ro_nombre::VARCHAR,
	        (SELECT COUNT(*) FROM Rol_Per WHERE Rol_ro_cod = p_id_rol)::INT,
	        v_permisos_json::JSON
	    FROM Rol r
	    WHERE r.ro_cod = p_id_rol;
	
	END;
	$$ LANGUAGE plpgsql;

-- LISTAR TODOS LOS PERMISOS DISPONIBLES
CREATE OR REPLACE FUNCTION fn_listar_permisos_disponibles()
	RETURNS TABLE (
	    cod INT,
	    nombre_permiso VARCHAR,
	    tipo_permiso VARCHAR
	) AS $$
	BEGIN
	    RETURN QUERY
	    SELECT 
	        p.pe_cod,
	        p.pe_nombre,
	        p.pe_tipo
	    FROM Permiso p
	    ORDER BY p.pe_tipo, p.pe_nombre;
	END;
	$$ LANGUAGE plpgsql;

-- REGISTRAR UN NUEVO ROL CON PERMISOS ASOCIADOS
CREATE OR REPLACE FUNCTION fn_crear_rol_con_permisos(
    p_nombre_rol VARCHAR,
    p_ids_permisos INT[] DEFAULT NULL::INT[]
)
	RETURNS TABLE (
	    exito BOOLEAN,
	    codigo_error INT,
	    mensaje TEXT,
	    id_rol_creado INT,
	    nombre_rol VARCHAR,
	    permisos_asignados INT
	) AS $$
	DECLARE
	    v_id_rol INT;
	    v_rol_existe BOOLEAN;
	    v_permiso_id INT;
	    v_permisos_creados INT := 0;
	    v_error_permiso VARCHAR;
	BEGIN
	    -- Validar nombre del rol
	    IF p_nombre_rol IS NULL OR TRIM(p_nombre_rol) = '' THEN
	        RETURN QUERY
	        SELECT 
	            FALSE::BOOLEAN,
	            1::INT,
	            'El nombre del rol no puede estar vacío',
	            NULL::INT,
	            NULL::VARCHAR,
	            0::INT;
	        RETURN;
	    END IF;
	
	    -- Validar que el nombre no esté duplicado
	    SELECT EXISTS(
	        SELECT 1 FROM Rol WHERE LOWER(ro_nombre) = LOWER(p_nombre_rol)
	    ) INTO v_rol_existe;
	
	    IF v_rol_existe THEN
	        RETURN QUERY
	        SELECT 
	            FALSE::BOOLEAN,
	            2::INT,
	            'Ya existe un rol con ese nombre',
	            NULL::INT,
	            NULL::VARCHAR,
	            0::INT;
	        RETURN;
	    END IF;
	
	    -- Crear el rol
	    INSERT INTO Rol (ro_nombre) VALUES (TRIM(p_nombre_rol))
	    RETURNING ro_cod INTO v_id_rol;
	
	    -- Asignar permisos si se proporcionaron
	    IF p_ids_permisos IS NOT NULL AND array_length(p_ids_permisos, 1) > 0 THEN
	        FOREACH v_permiso_id IN ARRAY p_ids_permisos LOOP
	            BEGIN
	                -- Validar que el permiso existe
	                IF NOT EXISTS(SELECT 1 FROM Permiso WHERE pe_cod = v_permiso_id) THEN
	                    v_error_permiso := 'Permiso ' || v_permiso_id || ' no existe. ';
	                ELSE
	                    -- Insertar relación rol-permiso
	                    INSERT INTO Rol_Per (Rol_ro_cod, Permiso_pe_cod)
	                    VALUES (v_id_rol, v_permiso_id);
	                    
	                    v_permisos_creados := v_permisos_creados + 1;
	                END IF;
	            EXCEPTION WHEN OTHERS THEN
	                -- Log silencioso para permisos duplicados o problemas
	                NULL;
	            END;
	        END LOOP;
	    END IF;
	
	    -- Retornar resultado exitoso
	    RETURN QUERY
	    SELECT 
	        TRUE::BOOLEAN,
	        0::INT,
	        'Rol "' || p_nombre_rol || '" creado exitosamente con ' || 
	        v_permisos_creados || ' permiso(s) asignado(s)'::VARCHAR,
	        v_id_rol::INT,
	        p_nombre_rol::VARCHAR,
	        v_permisos_creados::INT;
	
	END;
	$$ LANGUAGE plpgsql;

-- AGREGAR PERMISOS A UN ROL EXISTENTE
CREATE OR REPLACE FUNCTION fn_agregar_permisos_a_rol(
    p_id_rol INT,
    p_ids_permisos INT[]
)
	RETURNS TABLE (
	    exito BOOLEAN,
	    codigo_error INT,
	    mensaje VARCHAR,
	    permisos_agregados INT,
	    permisos_duplicados INT,
	    permisos_invalidos INT
	) AS $$
	DECLARE
	    v_rol_existe BOOLEAN;
	    v_permiso_id INT;
	    v_permisos_agregados INT := 0;
	    v_permisos_duplicados INT := 0;
	    v_permisos_invalidos INT := 0;
	BEGIN
	    -- Validar que el rol existe
	    SELECT EXISTS(SELECT 1 FROM Rol WHERE ro_cod = p_id_rol)
	    INTO v_rol_existe;
	
	    IF NOT v_rol_existe THEN
	        RETURN QUERY
	        SELECT 
	            FALSE::BOOLEAN,
	            1::INT,
	            'El rol especificado no existe'::VARCHAR,
	            0::INT,
	            0::INT,
	            0::INT;
	        RETURN;
	    END IF;
	
	    -- Validar que se proporcionaron permisos
	    IF p_ids_permisos IS NULL OR array_length(p_ids_permisos, 1) = 0 THEN
	        RETURN QUERY
	        SELECT 
	            FALSE::BOOLEAN,
	            2::INT,
	            'Debe proporcionar al menos un permiso para agregar'::VARCHAR,
	            0::INT,
	            0::INT,
	            0::INT;
	        RETURN;
	    END IF;
	
	    -- Procesar cada permiso
	    FOREACH v_permiso_id IN ARRAY p_ids_permisos LOOP
	        BEGIN
	            -- Validar que el permiso existe
	            IF NOT EXISTS(SELECT 1 FROM Permiso WHERE pe_cod = v_permiso_id) THEN
	                v_permisos_invalidos := v_permisos_invalidos + 1;
	            -- Verificar si ya está asignado
	            ELSIF EXISTS(
	                SELECT 1 FROM Rol_Per 
	                WHERE Rol_ro_cod = p_id_rol AND Permiso_pe_cod = v_permiso_id
	            ) THEN
	                v_permisos_duplicados := v_permisos_duplicados + 1;
	            ELSE
	                -- Agregar permiso
	                INSERT INTO Rol_Per (Rol_ro_cod, Permiso_pe_cod)
	                VALUES (p_id_rol, v_permiso_id);
	                v_permisos_agregados := v_permisos_agregados + 1;
	            END IF;
	        EXCEPTION WHEN OTHERS THEN
	            v_permisos_invalidos := v_permisos_invalidos + 1;
	        END;
	    END LOOP;
	
	    -- Retornar resultado
	    RETURN QUERY
	    SELECT 
	        TRUE::BOOLEAN,
	        0::INT,
	        'Proceso completado'::VARCHAR,
	        v_permisos_agregados::INT,
	        v_permisos_duplicados::INT,
	        v_permisos_invalidos::INT;
	
	END;
	$$ LANGUAGE plpgsql;

-- QUITAR PERMISOS DE UN ROL
CREATE OR REPLACE FUNCTION fn_quitar_permisos_de_rol(
    p_id_rol INT,
    p_ids_permisos INT[]
)
	RETURNS TABLE (
	    exito BOOLEAN,
	    codigo_error INT,
	    mensaje VARCHAR,
	    permisos_eliminados INT,
	    permisos_no_encontrados INT
	) AS $$
	DECLARE
	    v_rol_existe BOOLEAN;
	    v_permiso_id INT;
	    v_permisos_eliminados INT := 0;
	    v_permisos_no_encontrados INT := 0;
	BEGIN
	    -- Validar que el rol existe
	    SELECT EXISTS(SELECT 1 FROM Rol WHERE ro_cod = p_id_rol)
	    INTO v_rol_existe;
	
	    IF NOT v_rol_existe THEN
	        RETURN QUERY
	        SELECT 
	            FALSE::BOOLEAN,
	            1::INT,
	            'El rol especificado no existe'::VARCHAR,
	            0::INT,
	            0::INT;
	        RETURN;
	    END IF;
	
	    -- Validar que se proporcionaron permisos
	    IF p_ids_permisos IS NULL OR array_length(p_ids_permisos, 1) = 0 THEN
	        RETURN QUERY
	        SELECT 
	            FALSE::BOOLEAN,
	            2::INT,
	            'Debe proporcionar al menos un permiso para quitar'::VARCHAR,
	            0::INT,
	            0::INT;
	        RETURN;
	    END IF;
	
	    -- Procesar cada permiso
	    FOREACH v_permiso_id IN ARRAY p_ids_permisos LOOP
	        BEGIN
	            -- Verificar si el permiso está asignado al rol
	            IF NOT EXISTS(
	                SELECT 1 FROM Rol_Per 
	                WHERE Rol_ro_cod = p_id_rol AND Permiso_pe_cod = v_permiso_id
	            ) THEN
	                v_permisos_no_encontrados := v_permisos_no_encontrados + 1;
	            ELSE
	                -- Eliminar permiso
	                DELETE FROM Rol_Per 
	                WHERE Rol_ro_cod = p_id_rol AND Permiso_pe_cod = v_permiso_id;
	                v_permisos_eliminados := v_permisos_eliminados + 1;
	            END IF;
	        EXCEPTION WHEN OTHERS THEN
	            v_permisos_no_encontrados := v_permisos_no_encontrados + 1;
	        END;
	    END LOOP;
	
	    -- Retornar resultado
	    RETURN QUERY
	    SELECT 
	        TRUE::BOOLEAN,
	        0::INT,
	        'Permisos eliminados: ' || v_permisos_eliminados || 
	        ', No encontrados: ' || v_permisos_no_encontrados::VARCHAR,
	        v_permisos_eliminados::INT,
	        v_permisos_no_encontrados::INT;
	
	END;
	$$ LANGUAGE plpgsql;

-- ACTUALIZAR NOMBRE DEL ROL
CREATE OR REPLACE FUNCTION fn_actualizar_nombre_rol(
    p_id_rol INT,
    p_nuevo_nombre VARCHAR
)
	RETURNS TABLE (
	    exito BOOLEAN,
	    codigo_error INT,
	    mensaje VARCHAR,
	    id_rol INT,
	    nombre_rol_anterior VARCHAR,
	    nombre_rol_nuevo VARCHAR
	) AS $$
	DECLARE
	    v_rol_existe BOOLEAN;
	    v_nombre_anterior VARCHAR;
	    v_nombre_duplicado BOOLEAN;
	BEGIN
	    -- Validar que el rol existe
	    SELECT EXISTS(SELECT 1 FROM Rol WHERE ro_cod = p_id_rol)
	    INTO v_rol_existe;
	
	    IF NOT v_rol_existe THEN
	        RETURN QUERY
	        SELECT 
	            FALSE::BOOLEAN,
	            1::INT,
	            'El rol especificado no existe'::VARCHAR,
	            NULL::INT,
	            NULL::VARCHAR,
	            NULL::VARCHAR;
	        RETURN;
	    END IF;
	
	    -- Validar nombre vacío
	    IF p_nuevo_nombre IS NULL OR TRIM(p_nuevo_nombre) = '' THEN
	        RETURN QUERY
	        SELECT 
	            FALSE::BOOLEAN,
	            2::INT,
	            'El nuevo nombre del rol no puede estar vacío'::VARCHAR,
	            NULL::INT,
	            NULL::VARCHAR,
	            NULL::VARCHAR;
	        RETURN;
	    END IF;
	
	    -- Obtener nombre anterior
	    SELECT ro_nombre INTO v_nombre_anterior FROM Rol WHERE ro_cod = p_id_rol;
	
	    -- Verificar nombre duplicado
	    SELECT EXISTS(
	        SELECT 1 FROM Rol 
	        WHERE LOWER(ro_nombre) = LOWER(p_nuevo_nombre) AND ro_cod != p_id_rol
	    ) INTO v_nombre_duplicado;
	
	    IF v_nombre_duplicado THEN
	        RETURN QUERY
	        SELECT 
	            FALSE::BOOLEAN,
	            3::INT,
	            'Ya existe otro rol con ese nombre'::VARCHAR,
	            NULL::INT,
	            NULL::VARCHAR,
	            NULL::VARCHAR;
	        RETURN;
	    END IF;
	
	    -- Actualizar nombre
	    UPDATE Rol 
	    SET ro_nombre = TRIM(p_nuevo_nombre)
	    WHERE ro_cod = p_id_rol;
	
	    -- Retornar resultado
	    RETURN QUERY
	    SELECT 
	        TRUE::BOOLEAN,
	        0::INT,
	        'Nombre del rol actualizado exitosamente'::VARCHAR,
	        p_id_rol::INT,
	        v_nombre_anterior::VARCHAR,
	        p_nuevo_nombre::VARCHAR;
	
	END;
	$$ LANGUAGE plpgsql;

-- VALIDAR SI UN ROL TIENE UN PERMISO ESPECÍFICO
CREATE OR REPLACE FUNCTION fn_rol_tiene_permiso(
    p_id_rol INT,
    p_nombre_permiso VARCHAR
)
	RETURNS BOOLEAN AS $$
	BEGIN
	    RETURN EXISTS(
	        SELECT 1 FROM Rol_Per rp
	        INNER JOIN Permiso p ON rp.Permiso_pe_cod = p.pe_cod
	        WHERE rp.Rol_ro_cod = p_id_rol 
	        AND LOWER(p.pe_nombre) = LOWER(p_nombre_permiso)
	    );
	END;
	$$ LANGUAGE plpgsql;

-- ===================================================
-- STORE PROCEDURES Y FUNCIONES - GESTIÓN DE PROMOCIONES
-- ===================================================

-- FUNCION AUXILIAR
-- Obtener el tipo de proveedor de un servicio
CREATE OR REPLACE FUNCTION fn_obtener_tipo_proveedor_servicio(
    p_id_servicio INT
)
	RETURNS VARCHAR AS $$
	BEGIN
	    -- Verificar en Vuelo (Aerolinea)
	    IF EXISTS (SELECT 1 FROM Vuelo WHERE s_cod = p_id_servicio) THEN
	        RETURN 'Aerolinea';
	    END IF;
	
	    -- Verificar en Viaje (Crucero)
	    IF EXISTS (SELECT 1 FROM Viaje WHERE s_cod = p_id_servicio) THEN
	        RETURN 'Crucero';
	    END IF;
	
	    -- Verificar en Traslado (Transporte)
	    IF EXISTS (SELECT 1 FROM Traslado WHERE s_cod = p_id_servicio) THEN
	        RETURN 'Transporte';
	    END IF;
	
	    -- Verificar en Habitacion (Hotel)
	    IF EXISTS (SELECT 1 FROM Habitacion WHERE s_cod = p_id_servicio) THEN
	        RETURN 'Hotel';
	    END IF;
	
	    -- Verificar en Servicio_Adicional (Operador)
	    IF EXISTS (SELECT 1 FROM Servicio_Adicional WHERE s_cod = p_id_servicio) THEN
	        RETURN 'Operador';
	    END IF;
	
	    RETURN NULL;
	END;
	$$ LANGUAGE plpgsql;

-- FUNCION AUXILIAR
-- Validar que el servicio pertenece al proveedor
CREATE OR REPLACE FUNCTION fn_validar_proveedor_servicio(
    p_id_servicio INT,
    p_id_proveedor INT,
    p_tipo_proveedor VARCHAR
)
	RETURNS BOOLEAN AS $$
	BEGIN
	    CASE UPPER(p_tipo_proveedor)
	        WHEN 'AEROLINEA' THEN
	            RETURN EXISTS (
	                SELECT 1 FROM Vuelo v
	                WHERE v.s_cod = p_id_servicio
	            );
	        WHEN 'CRUCERO' THEN
	            RETURN EXISTS (
	                SELECT 1 FROM Viaje v
	                WHERE v.s_cod = p_id_servicio
	            );
	        WHEN 'TRANSPORTE' THEN
	            RETURN EXISTS (
	                SELECT 1 FROM Traslado t
	                WHERE t.s_cod = p_id_servicio
	                AND t.Transporte_Terrestre_p_cod = p_id_proveedor
	            );
	        WHEN 'HOTEL' THEN
	            RETURN EXISTS (
	                SELECT 1 FROM Habitacion h
	                WHERE h.s_cod = p_id_servicio
	                AND h.Hotel_p_cod = p_id_proveedor
	            );
	        WHEN 'OPERADOR' THEN
	            RETURN EXISTS (
	                SELECT 1 FROM Servicio_Adicional sa
	                WHERE sa.s_cod = p_id_servicio
	                AND sa.Operador_Turistico_p_cod = p_id_proveedor
	            );
	        ELSE
	            RETURN FALSE;
	    END CASE;
	END;
	$$ LANGUAGE plpgsql;

-- REGISTRAR PROMOCIÓN CON SERVICIOS
CREATE OR REPLACE FUNCTION fn_registrar_promocion(
    p_nombre VARCHAR,
    p_porcentaje NUMERIC,
    p_id_proveedor INT,
    p_tipo_proveedor VARCHAR,
    p_servicios_ids INT[]
)
	RETURNS TABLE (
	    exito BOOLEAN,
	    codigo_error INT,
	    mensaje TEXT,
	    id_promocion INT
	) AS $$
	DECLARE
	    v_id_promocion INT;
	    v_id_servicio INT;
	    v_costo_servicio NUMERIC;
	    v_monto_descuento NUMERIC;
	    v_tabla_proveedor VARCHAR;
	    v_columna_fk VARCHAR;
	    v_id_proveedor_servicio INT;
	    v_tipo_proveedor_servicio VARCHAR;
	    v_contador INT;
	    v_error_msg VARCHAR;
	BEGIN
	    -- Validaciones iniciales
	    IF p_porcentaje NOT BETWEEN 1 AND 90 THEN
	        RETURN QUERY SELECT false, 101, 'El porcentaje debe estar entre 1 y 90', NULL::int;
	        RETURN;
	    END IF;
	
	    IF p_nombre IS NULL OR TRIM(p_nombre) = '' THEN
	        RETURN QUERY SELECT false, 102, 'El nombre de la promoción no puede estar vacío', NULL::int;
	        RETURN;
	    END IF;
	
	    IF p_servicios_ids IS NULL OR ARRAY_LENGTH(p_servicios_ids, 1) = 0 THEN
	        RETURN QUERY SELECT false, 103, 'Debe proporcionar al menos un servicio para la promoción', NULL::int;
	        RETURN;
	    END IF;
	
	    -- Validar que el tipo de proveedor sea válido
	    IF UPPER(p_tipo_proveedor) NOT IN ('AEROLINEA', 'CRUCERO', 'TRANSPORTE', 'HOTEL', 'OPERADOR') THEN
	        RETURN QUERY SELECT false, 104, 'Tipo de proveedor inválido', NULL::int;
	        RETURN;
	    END IF;
	
	    BEGIN
	        -- Crear la promoción según el tipo de proveedor
	        CASE UPPER(p_tipo_proveedor)
	            WHEN 'AEROLINEA' THEN
	                INSERT INTO Promocion (pr_nombre, pr_porcentaje, Aerolinea_p_cod)
	                VALUES (p_nombre, p_porcentaje, p_id_proveedor)
	                RETURNING pr_cod INTO v_id_promocion;
	            WHEN 'CRUCERO' THEN
	                INSERT INTO Promocion (pr_nombre, pr_porcentaje, Crucero_p_cod)
	                VALUES (p_nombre, p_porcentaje, p_id_proveedor)
	                RETURNING pr_cod INTO v_id_promocion;
	            WHEN 'TRANSPORTE' THEN
	                INSERT INTO Promocion (pr_nombre, pr_porcentaje, Transporte_Terrestre_p_cod)
	                VALUES (p_nombre, p_porcentaje, p_id_proveedor)
	                RETURNING pr_cod INTO v_id_promocion;
	            WHEN 'HOTEL' THEN
	                INSERT INTO Promocion (pr_nombre, pr_porcentaje, Hotel_p_cod)
	                VALUES (p_nombre, p_porcentaje, p_id_proveedor)
	                RETURNING pr_cod INTO v_id_promocion;
	            WHEN 'OPERADOR' THEN
	                INSERT INTO Promocion (pr_nombre, pr_porcentaje, Operador_Turistico_p_cod)
	                VALUES (p_nombre, p_porcentaje, p_id_proveedor)
	                RETURNING pr_cod INTO v_id_promocion;
	        END CASE;
	
	        -- Validar y agregar servicios a la promoción
	        FOREACH v_id_servicio IN ARRAY p_servicios_ids
	        LOOP
	            -- Validar que el servicio existe
	            IF NOT EXISTS (SELECT 1 FROM Servicio WHERE s_cod = v_id_servicio) THEN
	                DELETE FROM Promocion WHERE pr_cod = v_id_promocion;
	                RETURN QUERY SELECT false, 105, 'Servicio con código ' || v_id_servicio || ' no existe', NULL::int;
	                RETURN;
	            END IF;
	
	            -- Obtener el costo del servicio
	            SELECT s_costo INTO v_costo_servicio FROM Servicio WHERE s_cod = v_id_servicio;
	
	            -- Validar que el servicio pertenece al mismo proveedor
	            v_tipo_proveedor_servicio := fn_obtener_tipo_proveedor_servicio(v_id_servicio);
	            
	            IF v_tipo_proveedor_servicio IS NULL THEN
	                DELETE FROM Promocion WHERE pr_cod = v_id_promocion;
	                RETURN QUERY SELECT false, 106, 'No se pudo determinar el proveedor del servicio ' || v_id_servicio, NULL::int;
	                RETURN;
	            END IF;
	
	            -- Validar que el tipo de proveedor del servicio coincida
	            IF UPPER(v_tipo_proveedor_servicio) != UPPER(p_tipo_proveedor) THEN
	                DELETE FROM Promocion WHERE pr_cod = v_id_promocion;
	                RETURN QUERY SELECT false, 107, 'El servicio ' || v_id_servicio || ' no pertenece a un ' || p_tipo_proveedor, NULL::int;
	                RETURN;
	            END IF;
	
	            -- Validar que el proveedor del servicio sea el mismo que el de la promoción
	            IF NOT fn_validar_proveedor_servicio(v_id_servicio, p_id_proveedor, p_tipo_proveedor) THEN
	                DELETE FROM Promocion WHERE pr_cod = v_id_promocion;
	                RETURN QUERY SELECT false, 108, 'El servicio ' || v_id_servicio || ' no pertenece al proveedor especificado', NULL::int;
	                RETURN;
	            END IF;
	
	            -- Calcular monto de descuento: (costo * porcentaje) / 100
	            v_monto_descuento := ROUND((v_costo_servicio * p_porcentaje) / 100, 2);
	
	            -- Insertar en tabla Pro_Ser con el monto del descuento
	            INSERT INTO Pro_Ser (ps_monto, Promocion_pr_cod, Servicio_s_cod)
	            VALUES (v_monto_descuento, v_id_promocion, v_id_servicio);
	        END LOOP;
	
	        RETURN QUERY SELECT true, 0, 'Promoción registrada exitosamente con ' || ARRAY_LENGTH(p_servicios_ids, 1) || ' servicios', v_id_promocion;
	
	    EXCEPTION WHEN OTHERS THEN
	        RETURN QUERY SELECT false, 999, 'Error al registrar promoción: ' || SQLERRM, NULL::int;
	    END;
	
	END;
	$$ LANGUAGE plpgsql;

-- OBTENER INFORMACIÓN DE PROMOCIÓN
CREATE OR REPLACE FUNCTION fn_obtener_promocion(
    p_id_promocion INT
)
	RETURNS TABLE (
	    id_promocion INT,
	    nombre_promocion VARCHAR,
	    porcentaje NUMERIC,
	    tipo_proveedor VARCHAR,
	    id_proveedor INT,
	    nombre_proveedor VARCHAR,
	    servicios_json JSONB
	) AS $$
	DECLARE
	    v_servicios JSONB;
	BEGIN
	    SELECT COALESCE(
	        json_agg(
	            json_build_object(
	                'id_servicio', ps.Servicio_s_cod,
	                'costo_original', s.s_costo,
	                'monto_descuento', ps.ps_monto,
	                'costo_final', ROUND(s.s_costo - ps.ps_monto, 2),
	                'tipo_proveedor', fn_obtener_tipo_proveedor_servicio(ps.Servicio_s_cod)
	            )
	        ),
	        '[]'::json
	    ) INTO v_servicios
	    FROM Pro_Ser ps
	    JOIN Servicio s ON ps.Servicio_s_cod = s.s_cod
	    WHERE ps.Promocion_pr_cod = p_id_promocion;
	
	    RETURN QUERY
	    SELECT 
	        p.pr_cod,
	        p.pr_nombre,
	        p.pr_porcentaje,
	        CASE 
	            WHEN p.Aerolinea_p_cod IS NOT NULL THEN 'Aerolinea'::VARCHAR
	            WHEN p.Crucero_p_cod IS NOT NULL THEN 'Crucero'::VARCHAR
	            WHEN p.Transporte_Terrestre_p_cod IS NOT NULL THEN 'Transporte'::VARCHAR
	            WHEN p.Hotel_p_cod IS NOT NULL THEN 'Hotel'::VARCHAR
	            WHEN p.Operador_Turistico_p_cod IS NOT NULL THEN 'Operador'::VARCHAR
	        END,
	        COALESCE(p.Aerolinea_p_cod, p.Crucero_p_cod, p.Transporte_Terrestre_p_cod, p.Hotel_p_cod, p.Operador_Turistico_p_cod),
	        COALESCE(a.p_nombre, c.p_nombre, tt.p_nombre, h.p_nombre, ot.p_nombre),
	        v_servicios::jsonb
	    FROM Promocion p
	    LEFT JOIN Aerolinea a ON p.Aerolinea_p_cod = a.p_cod
	    LEFT JOIN Crucero c ON p.Crucero_p_cod = c.p_cod
	    LEFT JOIN Transporte_Terrestre tt ON p.Transporte_Terrestre_p_cod = tt.p_cod
	    LEFT JOIN Hotel h ON p.Hotel_p_cod = h.p_cod
	    LEFT JOIN Operador_Turistico ot ON p.Operador_Turistico_p_cod = ot.p_cod
	    WHERE p.pr_cod = p_id_promocion;
	END;
	$$ LANGUAGE plpgsql;

-- LISTAR TODAS LAS PROMOCIONES
CREATE OR REPLACE FUNCTION fn_listar_promociones()
	RETURNS TABLE (
	    id_promocion INT,
	    nombre VARCHAR,
	    porcentaje NUMERIC,
	    tipo_proveedor VARCHAR,
	    nombre_proveedor VARCHAR,
	    cantidad_servicios INT,
	    descuento_promedio NUMERIC
	) AS $$
	BEGIN
	    RETURN QUERY
	    SELECT 
	        p.pr_cod,
	        p.pr_nombre,
	        p.pr_porcentaje,
	        CASE 
	            WHEN p.Aerolinea_p_cod IS NOT NULL THEN 'Aerolinea'::VARCHAR
	            WHEN p.Crucero_p_cod IS NOT NULL THEN 'Crucero'::VARCHAR
	            WHEN p.Transporte_Terrestre_p_cod IS NOT NULL THEN 'Transporte'::VARCHAR
	            WHEN p.Hotel_p_cod IS NOT NULL THEN 'Hotel'::VARCHAR
	            WHEN p.Operador_Turistico_p_cod IS NOT NULL THEN 'Operador'::VARCHAR
	        END,
	        COALESCE(a.p_nombre, c.p_nombre, tt.p_nombre, h.p_nombre, ot.p_nombre),
	        COUNT(ps.Servicio_s_cod)::INT,
	        ROUND(AVG(ps.ps_monto), 2)
	    FROM Promocion p
	    LEFT JOIN Aerolinea a ON p.Aerolinea_p_cod = a.p_cod
	    LEFT JOIN Crucero c ON p.Crucero_p_cod = c.p_cod
	    LEFT JOIN Transporte_Terrestre tt ON p.Transporte_Terrestre_p_cod = tt.p_cod
	    LEFT JOIN Hotel h ON p.Hotel_p_cod = h.p_cod
	    LEFT JOIN Operador_Turistico ot ON p.Operador_Turistico_p_cod = ot.p_cod
	    LEFT JOIN Pro_Ser ps ON p.pr_cod = ps.Promocion_pr_cod
	    GROUP BY p.pr_cod, p.pr_nombre, p.pr_porcentaje, a.p_nombre, c.p_nombre, tt.p_nombre, h.p_nombre, ot.p_nombre
	    ORDER BY p.pr_cod DESC;
	END;
	$$ LANGUAGE plpgsql;

-- AGREGAR SERVICIOS A PROMOCIÓN
CREATE OR REPLACE FUNCTION fn_agregar_servicios_promocion(
    p_id_promocion INT,
    p_servicios_ids INT[]
)
	RETURNS TABLE (
	    exito BOOLEAN,
	    codigo_error INT,
	    mensaje VARCHAR,
	    servicios_agregados INT
	) AS $$
	DECLARE
	    v_id_servicio INT;
	    v_costo_servicio NUMERIC;
	    v_monto_descuento NUMERIC;
	    v_porcentaje NUMERIC;
	    v_tipo_proveedor_promocion VARCHAR;
	    v_id_proveedor_promocion INT;
	    v_contador INT := 0;
	    v_error_msg VARCHAR;
	BEGIN
	    -- Validar que la promoción existe
	    IF NOT EXISTS (SELECT 1 FROM Promocion WHERE pr_cod = p_id_promocion) THEN
	        RETURN QUERY SELECT false, 201, 'La promoción con código ' || p_id_promocion || ' no existe', NULL;
	        RETURN;
	    END IF;
	
	    -- Validar servicios no vacío
	    IF p_servicios_ids IS NULL OR ARRAY_LENGTH(p_servicios_ids, 1) = 0 THEN
	        RETURN QUERY SELECT false, 202, 'Debe proporcionar al menos un servicio', NULL;
	        RETURN;
	    END IF;
	
	    BEGIN
	        -- Obtener información de la promoción
	        SELECT pr_porcentaje INTO v_porcentaje FROM Promocion WHERE pr_cod = p_id_promocion;
	        
	        SELECT 
	            CASE 
	                WHEN Aerolinea_p_cod IS NOT NULL THEN 'Aerolinea'
	                WHEN Crucero_p_cod IS NOT NULL THEN 'Crucero'
	                WHEN Transporte_Terrestre_p_cod IS NOT NULL THEN 'Transporte'
	                WHEN Hotel_p_cod IS NOT NULL THEN 'Hotel'
	                WHEN Operador_Turistico_p_cod IS NOT NULL THEN 'Operador'
	            END,
	            COALESCE(Aerolinea_p_cod, Crucero_p_cod, Transporte_Terrestre_p_cod, Hotel_p_cod, Operador_Turistico_p_cod)
	        INTO v_tipo_proveedor_promocion, v_id_proveedor_promocion
	        FROM Promocion WHERE pr_cod = p_id_promocion;
	
	        -- Procesar cada servicio
	        FOREACH v_id_servicio IN ARRAY p_servicios_ids
	        LOOP
	            -- Validar que el servicio no está ya en la promoción
	            IF EXISTS (SELECT 1 FROM Pro_Ser WHERE Promocion_pr_cod = p_id_promocion AND Servicio_s_cod = v_id_servicio) THEN
	                RETURN QUERY SELECT false, 203, 'El servicio ' || v_id_servicio || ' ya está asociado a esta promoción', NULL;
	                RETURN;
	            END IF;
	
	            -- Validar que el servicio existe
	            IF NOT EXISTS (SELECT 1 FROM Servicio WHERE s_cod = v_id_servicio) THEN
	                RETURN QUERY SELECT false, 204, 'El servicio ' || v_id_servicio || ' no existe', NULL;
	                RETURN;
	            END IF;
	
	            -- Validar que el servicio pertenece al mismo tipo de proveedor
	            IF fn_obtener_tipo_proveedor_servicio(v_id_servicio) != v_tipo_proveedor_promocion THEN
	                RETURN QUERY SELECT false, 205, 'El servicio ' || v_id_servicio || ' no pertenece a un ' || v_tipo_proveedor_promocion, NULL;
	                RETURN;
	            END IF;
	
	            -- Validar que el proveedor del servicio es el mismo
	            IF NOT fn_validar_proveedor_servicio(v_id_servicio, v_id_proveedor_promocion, v_tipo_proveedor_promocion) THEN
	                RETURN QUERY SELECT false, 206, 'El servicio ' || v_id_servicio || ' no pertenece al proveedor de la promoción', NULL;
	                RETURN;
	            END IF;
	
	            -- Obtener costo del servicio
	            SELECT s_costo INTO v_costo_servicio FROM Servicio WHERE s_cod = v_id_servicio;
	
	            -- Calcular monto de descuento
	            v_monto_descuento := ROUND((v_costo_servicio * v_porcentaje) / 100, 2);
	
	            -- Insertar el servicio a la promoción
	            INSERT INTO Pro_Ser (ps_monto, Promocion_pr_cod, Servicio_s_cod)
	            VALUES (v_monto_descuento, p_id_promocion, v_id_servicio);
	
	            v_contador := v_contador + 1;
	        END LOOP;
	
	        RETURN QUERY SELECT true, 0, 'Se agregaron ' || v_contador || ' servicios exitosamente', v_contador;
	
	    EXCEPTION WHEN OTHERS THEN
	        RETURN QUERY SELECT false, 999, 'Error al agregar servicios: ' || SQLERRM, NULL;
	    END;
	
	END;
	$$ LANGUAGE plpgsql;

-- QUITAR SERVICIOS DE PROMOCIÓN
CREATE OR REPLACE FUNCTION fn_quitar_servicios_promocion(
    p_id_promocion INT,
    p_servicios_ids INT[]
)
	RETURNS TABLE (
	    exito BOOLEAN,
	    codigo_error INT,
	    mensaje TEXT,
	    servicios_eliminados INT
	) AS $$
	DECLARE
	    v_id_servicio INT;
	    v_contador INT := 0;
	    v_total_servicios INT;
	BEGIN
	    -- Validar que la promoción existe
	    IF NOT EXISTS (SELECT 1 FROM Promocion WHERE pr_cod = p_id_promocion) THEN
	        RETURN QUERY SELECT false, 301, 'La promoción con código ' || p_id_promocion || ' no existe', NULL::INT;
	        RETURN;
	    END IF;
	
	    -- Validar servicios no vacío
	    IF p_servicios_ids IS NULL OR ARRAY_LENGTH(p_servicios_ids, 1) = 0 THEN
	        RETURN QUERY SELECT false, 302, 'Debe proporcionar al menos un servicio', NULL::INT;
	        RETURN;
	    END IF;
	
	    BEGIN
	        -- Contar servicios actuales de la promoción
	        SELECT COUNT(*) INTO v_total_servicios FROM Pro_Ser WHERE Promocion_pr_cod = p_id_promocion;
	
	        -- Validar que no sea el último servicio (una promoción debe tener al menos 1 servicio)
	        IF v_total_servicios - ARRAY_LENGTH(p_servicios_ids, 1) < 1 THEN
	            RETURN QUERY SELECT false, 303, 'Una promoción debe tener al menos un servicio. Actualmente tiene ' || v_total_servicios, NULL::INT;
	            RETURN;
	        END IF;
	
	        -- Procesar eliminación de servicios
	        FOREACH v_id_servicio IN ARRAY p_servicios_ids
	        LOOP
	            -- Validar que el servicio está en la promoción
	            IF NOT EXISTS (SELECT 1 FROM Pro_Ser WHERE Promocion_pr_cod = p_id_promocion AND Servicio_s_cod = v_id_servicio) THEN
	                RETURN QUERY SELECT false, 304, 'El servicio ' || v_id_servicio || ' no está asociado a esta promoción', NULL::INT;
	                RETURN;
	            END IF;
	
	            -- Eliminar el servicio
	            DELETE FROM Pro_Ser 
	            WHERE Promocion_pr_cod = p_id_promocion AND Servicio_s_cod = v_id_servicio;
	
	            v_contador := v_contador + 1;
	        END LOOP;
	
	        RETURN QUERY SELECT true, 0, 'Se eliminaron ' || v_contador || ' servicios exitosamente', v_contador;
	
	    EXCEPTION WHEN OTHERS THEN
	        RETURN QUERY SELECT false, 999, 'Error al eliminar servicios: ' || SQLERRM, NULL::INT;
	    END;
	
	END;
	$$ LANGUAGE plpgsql;

-- ACTUALIZAR PROMOCIÓN (Nombre y/o Porcentaje)
CREATE OR REPLACE FUNCTION fn_actualizar_promocion(
    p_id_promocion INT,
    p_nuevo_nombre VARCHAR DEFAULT NULL,
    p_nuevo_porcentaje NUMERIC DEFAULT NULL
)
	RETURNS TABLE (
	    exito BOOLEAN,
	    codigo_error INT,
	    mensaje TEXT
	) AS $$
	DECLARE
	    v_cambios_realizados INT := 0;
	BEGIN
	    -- Validar que la promoción existe
	    IF NOT EXISTS (SELECT 1 FROM Promocion WHERE pr_cod = p_id_promocion) THEN
	        RETURN QUERY SELECT false, 401, ('La promoción con código ' || p_id_promocion || ' no existe');
	        RETURN;
	    END IF;
	
	    -- Validar porcentaje si se proporciona
	    IF p_nuevo_porcentaje IS NOT NULL AND (p_nuevo_porcentaje < 0 OR p_nuevo_porcentaje > 100) THEN
	        RETURN QUERY SELECT false, 402, 'El porcentaje debe estar entre 0 y 100';
	        RETURN;
	    END IF;
	
	    BEGIN
	        -- Actualizar nombre si se proporciona
	        IF p_nuevo_nombre IS NOT NULL AND TRIM(p_nuevo_nombre) != '' THEN
	            UPDATE Promocion SET pr_nombre = p_nuevo_nombre WHERE pr_cod = p_id_promocion;
	            v_cambios_realizados := v_cambios_realizados + 1;
	        END IF;
	
	        -- Actualizar porcentaje y recalcular montos de descuento
	        IF p_nuevo_porcentaje IS NOT NULL THEN
	            UPDATE Promocion SET pr_porcentaje = p_nuevo_porcentaje WHERE pr_cod = p_id_promocion;
	            
	            -- Recalcular montos de descuento en Pro_Ser
	            UPDATE Pro_Ser ps SET ps_monto = ROUND((s.s_costo * p_nuevo_porcentaje) / 100, 2)
	            FROM Servicio s
	            WHERE ps.Promocion_pr_cod = p_id_promocion 
	            AND ps.Servicio_s_cod = s.s_cod;
	            
	            v_cambios_realizados := v_cambios_realizados + 1;
	        END IF;
	
	        IF v_cambios_realizados = 0 THEN
	            RETURN QUERY SELECT false, 403, 'No se proporcionaron cambios válidos';
	            RETURN;
	        END IF;
	
	        RETURN QUERY SELECT true, 0, ('Promoción actualizada exitosamente. ' || v_cambios_realizados || ' campo(s) modificado(s)');
	
	    EXCEPTION WHEN OTHERS THEN
	        RETURN QUERY SELECT false, 999, ('Error al actualizar promoción: ' || SQLERRM);
	    END;
	
	END;
	$$ LANGUAGE plpgsql;

-- ELIMINAR PROMOCIÓN
CREATE OR REPLACE FUNCTION fn_eliminar_promocion(
    p_id_promocion INT
)
	RETURNS TABLE (
	    exito BOOLEAN,
	    codigo_error INT,
	    mensaje TEXT
	) AS $$
	DECLARE
	    v_nombre_promocion VARCHAR;
	BEGIN
	    -- Validar que la promoción existe
	    IF NOT EXISTS (SELECT 1 FROM Promocion WHERE pr_cod = p_id_promocion) THEN
	        RETURN QUERY SELECT false, 501, 'La promoción con código ' || p_id_promocion || ' no existe';
	        RETURN;
	    END IF;
	
	    BEGIN
	        -- Obtener nombre antes de eliminar
	        SELECT pr_nombre INTO v_nombre_promocion FROM Promocion WHERE pr_cod = p_id_promocion;
	
	        -- Eliminar asociaciones en Pro_Ser (cascade)
	        DELETE FROM Pro_Ser WHERE Promocion_pr_cod = p_id_promocion;
	
	        -- Eliminar la promoción
	        DELETE FROM Promocion WHERE pr_cod = p_id_promocion;
	
	        RETURN QUERY SELECT true, 0, 'Promoción "' || v_nombre_promocion || '" eliminada exitosamente';
	
	    EXCEPTION WHEN OTHERS THEN
	        RETURN QUERY SELECT false, 999, 'Error al eliminar promoción: ' || SQLERRM;
	    END;
	
	END;
	$$ LANGUAGE plpgsql;	

-- ============================================================================
-- Sobre SERVICIOS
-- ============================================================================

-- LISTAR VUELOS
CREATE OR REPLACE FUNCTION fn_listar_vuelos()
RETURNS TABLE (
    cod_servicio INT,
    costo NUMERIC(10, 2),
    millas INT,
    codigo_vuelo VARCHAR,
    fecha_salida TIMESTAMP,
    duracion_horas NUMERIC,
    origen VARCHAR,
    destino VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        s.s_cod,
        s.s_costo,
        s.s_millas_otorgar,
        v.v_cod_vue,
        v.v_fecha_hora_salida,
        v.v_duracion_horas,
        l1.l_nombre AS origen,
        l2.l_nombre AS destino
    FROM Vuelo v
    JOIN Servicio s ON v.s_cod = s.s_cod
    JOIN Lugar l1 ON v.lugar_l_cod = l1.l_cod     -- Lugar de Salida
    JOIN Lugar l2 ON v.lugar_l_cod2 = l2.l_cod;   -- Lugar de Llegada
END;
$$ LANGUAGE plpgsql;

-- Listar Clases de Asiento para un vuelo
CREATE OR REPLACE FUNCTION fn_listar_clases_asiento_vuelo(
	p_cod_vuelo INT
) RETURNS TABLE (
	cod_clase INT,
	nombre VARCHAR,
	descripcion VARCHAR,
	costo NUMERIC
) AS $$
DECLARE
BEGIN
	RETURN QUERY 
	SELECT ca_cod, ca_nombre, ca_descripcion, ca_costo
	FROM Clase_Asiento
	JOIN Aer_Cla ac ON ca_cod = ac.clase_asiento_ca_cod
	JOIN Vuelo v ON v.aeronave_mt_cod = ac.aeronave_mt_cod AND s_cod = p_cod_vuelo;
END;
$$ LANGUAGE plpgslq;

-- LISTAR VIAJES (CRUCEROS)
CREATE OR REPLACE FUNCTION fn_listar_viajes()
RETURNS TABLE (
    cod_servicio INT,
    costo NUMERIC(10, 2),
    millas INT,
    fecha_salida TIMESTAMP,
    duracion_dias INT,
    nombre_barco VARCHAR,
    origen VARCHAR,
    destino VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        s.s_cod,
        s.s_costo,
        s.s_millas_otorgar,
        vi.vi_fecha_hora_salida,
        vi.vi_duracion_dias,
        b.b_nombre,
        l1.l_nombre AS origen,
        l2.l_nombre AS destino
    FROM Viaje vi
    JOIN Servicio s ON vi.s_cod = s.s_cod
    JOIN Barco b ON vi.barco_mt_cod = b.mt_cod
    JOIN Lugar l1 ON vi.lugar_l_cod = l1.l_cod
    JOIN Lugar l2 ON vi.lugar_l_cod2 = l2.l_cod;
END;
$$ LANGUAGE plpgsql;

-- Listar Tipos de Camarote para un Viaje
CREATE OR REPLACE FUNCTION fn_listar_tipos_camarote_viaje(
	p_cod_viaje INT
) RETURNS TABLE (
	cod_camarote INT,
	nombre VARCHAR,
	descripcion VARCHAR,
	capacidad INT,
	costo NUMERIC
) AS $$
DECLARE
BEGIN
	RETURN QUERY 
	SELECT tc_cod, tc_nombre, tc_descripcion, tc_capacidad, tc_costo
	FROM Tipo_Camarote
	JOIN Bar_Tip bt ON tc_cod = bt.tipo_camarote_tc_cod
	JOIN Viaje v ON v.barco_mt_cod = bt.barco_mt_cod AND s_cod = p_cod_viaje;
END;
$$ LANGUAGE plpgslq;

-- Listar Servicios para un Viaje
CREATE OR REPLACE FUNCTION fn_listar_servicios_viaje(
	p_cod_viaje INT
) RETURNS TABLE (
	cod_servicio INT,
	descripcion VARCHAR,
	costo NUMERIC
) AS $$
DECLARE
BEGIN
	RETURN QUERY 
	SELECT sb_cod, sb_descripcion, sb_costo 
	FROM Servicio_Barco
	JOIN Bar_Ser bs ON sb_cod = bs.servicio_barco_sb_cod
	JOIN Viaje v ON v.barco_mt_cod = bs.barco_mt_cod AND s_cod = p_cod_viaje;
END;
$$ LANGUAGE plpgslq;

-- LISTAR TRASLADOS
CREATE OR REPLACE FUNCTION fn_listar_traslados()
RETURNS TABLE (
    cod_servicio INT,
    costo NUMERIC(10, 2),
    millas INT,
    lugar_llegada VARCHAR,
    direccion_terminal_salida VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        s.s_cod,
        s.s_costo,
        s.s_millas_otorgar,
        l.l_nombre AS lugar_llegada,
        term.to_direccion AS direccion_terminal_salida
    FROM Traslado t
    JOIN Servicio s ON t.s_cod = s.s_cod
    JOIN Lugar l ON t.lugar_l_cod = l.l_cod
    JOIN Terminal_Operacion term ON t.terminal_operacion_to_cod = term.to_cod;
END;
$$ LANGUAGE plpgsql;

-- Listar Vehiculos para un Traslado
CREATE OR REPLACE FUNCTION fn_listar_vehiculos_traslado(
	p_cod_traslado INT
) RETURNS TABLE (
	cod_vehiculo INT,
	marca VARCHAR,
	modelo VARCHAR,
	capacidad INT,
	costo_por_km NUMERIC
) AS $$
DECLARE
BEGIN
	RETURN QUERY 
	SELECT a.mt_cod, mav_nombre, mv_nombre, a.mt_capacidad, a.a_costo_por_km
	FROM Automovil a
	JOIN Modelo ON mv_cod = a.modelo_mv_cod
	JOIN Marca ON mav_cod = marca_mav_cod
	JOIN Traslado t ON t.transporte_terrestre_p_cod = a.transporte_terrestre_p_cod AND t.s_cod = p_cod_traslado;
END;
$$ LANGUAGE plpgslq;

-- LISTAR SERVICIOS ADICIONALES
CREATE OR REPLACE FUNCTION fn_listar_servicios_adicionales()
RETURNS TABLE (
    cod_servicio INT,
    costo NUMERIC(10, 2),
    millas INT,
    nombre_servicio VARCHAR,
	lugar VARCHAR,
    capacidad INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        s.s_cod,
        s.s_costo,
        s.s_millas_otorgar,
        sa.sa_nombre,
		l.l_nombre,
        sa.sa_capacidad
    FROM Servicio_Adicional sa
    JOIN Servicio s ON sa.s_cod = s.s_cod
	JOIN Lugar l ON l.l_cod = sa.lugar_l_cod;
END;
$$ LANGUAGE plpgsql;

-- LISTAR HABITACIONES
CREATE OR REPLACE FUNCTION fn_listar_habitaciones()
RETURNS TABLE (
    cod_servicio INT,
    costo NUMERIC(10, 2),
    millas INT,
    nombre_hotel VARCHAR,
    numero_habitacion VARCHAR,
	tipo_habitacion VARCHAR,
	lugar VARCHAR,
    capacidad INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        s.s_cod,
        s.s_costo,
        s.s_millas_otorgar,
        h.p_nombre AS nombre_hotel,
        hab.ha_numero,
		th.th_nombre,
		l.l_nombre,
        hab.ha_capacidad
    FROM Habitacion hab
    JOIN Servicio s ON hab.s_cod = s.s_cod
	JOIN Tipo_Habitacion th ON hab.tipo_habitacion_th_cod = th.th_cod
    JOIN Hotel h ON hab.hotel_p_cod = h.p_cod
	JOIN Lugar l ON l.l_cod = h.lugar_l_cod;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- CRUD DE PAQUETE TURISTICO
-- ============================================================================

CREATE OR REPLACE FUNCTION fn_listar_restricciones_paquete()
	RETURNS TABLE (
		cod INT,
		restriccion_completa TEXT
	) AS $$
	DECLARE
	BEGIN
		RETURN QUERY SELECT rp_cod, rp_caracteristica || ' ' || rp_operador || ' ' || rp_valor_restriccion FROM Restriccion_Paquete;
	END;
	$$ LANGUAGE plpgsql;

-- CREAR PAQUETE TURISTICO
CREATE OR REPLACE PROCEDURE sp_crear_paquete_turistico(
	OUT p_paquete_nuevo INT,
    p_nombre VARCHAR,
    p_descripcion VARCHAR,
    p_cant_personas INT,
    p_costo NUMERIC,
    p_costo_millas INT,
	p_servicios_ids INT[],
    p_rp_cod INT DEFAULT NULL
	)
	AS $$
	DECLARE
	    v_pt_cod INT;
	    v_rp_cod INT;
		v_s_cod INT;
	BEGIN
	    -- Validar datos de entrada
	    IF p_nombre IS NULL OR p_nombre = '' OR p_descripcion IS NULL OR p_descripcion = '' THEN
	        RAISE EXCEPTION 'El nombre del paquete es requerido';
	    END IF;
	
	    IF p_cant_personas <= 0 THEN
	        RAISE EXCEPTION 'Deben ser mas de 0 personas';
	    END IF;
	
	    IF p_costo < 0 OR p_costo_millas < 0 THEN
	        RAISE EXCEPTION 'Los costos no pueden ser negativos';
	    END IF;
	
	    -- Gestionar restricción del paquete si se proporciona
	    v_rp_cod := NULL;
	    IF p_rp_cod IS NOT NULL THEN
	        -- Verificar si la restricción ya existe
	        SELECT rp_cod INTO v_rp_cod
	        FROM Restriccion_Paquete
	        WHERE rp_cod = p_rp_cod;
	
	        -- Si no existe, crear nueva restricción
	        IF v_rp_cod IS NULL THEN
	            RAISE EXCEPTION 'No existe la restriccion';
	        END IF;
	    END IF;
	
	    -- Crear el paquete turístico
	    INSERT INTO Paquete_Turistico (
	        pt_nombre,
	        pt_descripcion,
	        pt_cant_personas,
	        pt_costo,
	        pt_costo_millas,
	        Restriccion_Paquete_rp_cod
	    ) VALUES (
	        p_nombre,
	        p_descripcion,
	        p_cant_personas,
	        p_costo,
	        p_costo_millas,
	        v_rp_cod
	    )
	    RETURNING pt_cod INTO v_pt_cod;

		-- Procesar cada servicio
		IF p_servicios_ids IS NOT NULL AND ARRAY_LENGTH(p_servicios_ids, 1) IS NOT NULL THEN
			FOREACH v_s_cod IN ARRAY p_servicios_ids
			LOOP
				-- Validar que el servicio existe
				IF NOT EXISTS (SELECT 1 FROM Servicio WHERE s_cod = v_s_cod) THEN
					DELETE FROM Paquete_Turistico WHERE pt_cod = v_pt_cod;
					RAISE EXCEPTION 'Servicio con codigo % no existe', v_s_cod;
				END IF;

	            IF NOT EXISTS (SELECT 1 FROM Paq_Ser WHERE Paquete_Turistico_pt_cod = v_pt_cod AND Servicio_s_cod = v_s_cod) THEN
					INSERT INTO Paq_Ser VALUES (v_pt_cod, v_s_cod);
				END IF;
			END LOOP;
		END IF;

		p_paquete_nuevo := v_pt_cod;
		
	    RAISE NOTICE 'Paquete creado exitosamente con código: %', p_paquete_nuevo;
	END;
	$$ LANGUAGE plpgsql;

-- LISTAR TODOS LOS PAQUETES TURISTICOS
CREATE OR REPLACE FUNCTION fn_listar_paquetes_turisticos()
	RETURNS TABLE (
	    pt_cod INT,
	    pt_nombre VARCHAR,
	    pt_descripcion VARCHAR,
	    pt_cant_personas INT,
	    pt_costo NUMERIC,
	    pt_costo_millas INT,
	    cantidad_servicios INT
	) AS $$
	BEGIN
	    RETURN QUERY
	    SELECT
	        p.pt_cod,
	        p.pt_nombre,
	        p.pt_descripcion,
	        p.pt_cant_personas,
	        p.pt_costo,
	        p.pt_costo_millas,
	        COUNT(ps.Servicio_s_cod)::INT AS cantidad_servicios
	    FROM Paquete_Turistico p
	    LEFT JOIN Paq_Ser ps ON p.pt_cod = ps.Paquete_Turistico_pt_cod
	    GROUP BY p.pt_cod;
	END;
	$$ LANGUAGE plpgsql;

-- OBTENER PAQUETE TURISTICO POR ID CON DETALLES COMPLETOS
CREATE OR REPLACE FUNCTION fn_obtener_paquete_por_id(
    p_pt_cod INT
)
	RETURNS TABLE (
	    cod INT,
	    nombre VARCHAR,
	    descripcion VARCHAR,
	    cant_personas INT,
	    costo NUMERIC,
	    costo_millas INT
	) AS $$
	DECLARE
	    v_paquete_json JSON;
	BEGIN
	    IF NOT EXISTS (SELECT 1 FROM Paquete_Turistico WHERE pt_cod = p_pt_cod) THEN
	        RAISE EXCEPTION 'El paquete con codigo % no existe', p_pt_cod;
	    END IF;
	
	    RETURN QUERY SELECT p.pt_cod, 
			p.pt_nombre, 
			p.pt_descripcion, 
			p.pt_cant_personas, 
			p.pt_costo, 
			p.pt_costo_millas
		FROM Paquete_Turistico p
		WHERE p.pt_cod = p_pt_cod;
	END;
	$$ LANGUAGE plpgsql;

-- ACTUALIZAR PAQUETE TURISTICO
CREATE OR REPLACE PROCEDURE sp_actualizar_paquete_turistico(
    OUT mensaje VARCHAR,
	p_pt_cod INT,
    p_nombre VARCHAR DEFAULT NULL,
    p_descripcion VARCHAR DEFAULT NULL,
    p_cant_personas INT DEFAULT NULL,
    p_costo NUMERIC DEFAULT NULL,
    p_costo_millas INT DEFAULT NULL,
    p_rp_cod INT DEFAULT NULL
)
	AS $$
	DECLARE
	    v_nombre_actual VARCHAR;
	    v_rp_cod INT;
	BEGIN
	    -- Validar que el paquete existe
	    SELECT pt_nombre INTO v_nombre_actual FROM Paquete_Turistico WHERE pt_cod = p_pt_cod;
	
	    IF v_nombre_actual IS NULL THEN
			RAISE EXCEPTION 'No se encontro el paquete';
	    END IF;
	
	    -- Validar datos si se proporcionan
	    IF p_cant_personas IS NOT NULL AND p_cant_personas <= 0 THEN
	        RAISE EXCEPTION 'La cantidad de personas debe ser mayor a 0';
	    END IF;
	
	    IF (p_costo IS NOT NULL AND p_costo < 0) OR (p_costo_millas IS NOT NULL AND p_costo_millas < 0) THEN
	        RAISE EXCEPTION 'Los costos no puede ser negativos';
	    END IF;
	
	    -- Gestionar restricción si se proporciona
	    IF p_rp_cod IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Restriccion_Paquete WHERE rp_cod = p_rp_cod) THEN
	        RAISE EXCEPTION 'La restriccion no existe';
	    END IF;
	
	    -- Actualizar el paquete
	    UPDATE Paquete_Turistico
	    SET
	        pt_nombre = COALESCE(p_nombre, pt_nombre),
	        pt_descripcion = COALESCE(p_descripcion, pt_descripcion),
	        pt_cant_personas = COALESCE(p_cant_personas, pt_cant_personas),
	        pt_costo = COALESCE(p_costo, pt_costo),
	        pt_costo_millas = COALESCE(p_costo_millas, pt_costo_millas),
	        Restriccion_Paquete_rp_cod = COALESCE(v_rp_cod, Restriccion_Paquete_rp_cod)
	    WHERE pt_cod = p_pt_cod;

		mensaje:= 'Paquete actualizado';
		
	    RAISE NOTICE 'Actualizado correctamente';
	END;
	$$ LANGUAGE plpgsql;

-- ELIMINAR PAQUETE TURISTICO
CREATE OR REPLACE PROCEDURE sp_eliminar_paquete_turistico(
    p_pt_cod INT,
	OUT mensaje VARCHAR
) AS $$
BEGIN
    -- Verificar si el paquete existe
    IF NOT EXISTS (SELECT 1 FROM Paquete_Turistico WHERE pt_cod = p_pt_cod) THEN
        RAISE EXCEPTION 'No se ha encontrado el paquete con codigo %', p_pt_cod;
    END IF;

    -- Eliminar los asociados
    DELETE FROM Paq_Ser WHERE Paquete_Turistico_pt_cod = p_pt_cod;
	DELETE FROM Deseo_Paquete WHERE Paquete_Turistico_pt_cod = p_pt_cod;
	DELETE FROM Eti_Paq WHERE Paquete_Turistico_pt_cod = p_pt_cod;

    -- Eliminar el paquete
    DELETE FROM Paquete_Turistico WHERE pt_cod = p_pt_cod;

    mensaje:='Paquete eliminado correctamente';
	
END;
$$ LANGUAGE plpgsql;

-- PROCEDIMIENTO PARA AGREGAR SERVICIOS A PAQUETE
CREATE OR REPLACE PROCEDURE sp_agregar_servicios_paquete(
    p_paquete_id INT,
    p_servicios_ids INT[]
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_servicio_id INT;
    v_existe_paquete BOOLEAN;
    v_existe_servicio BOOLEAN;
    v_ya_asociado BOOLEAN;
BEGIN
    -- Validar que el paquete existe
    SELECT EXISTS(SELECT 1 FROM Paquete_Turistico WHERE pt_cod = p_paquete_id) INTO v_existe_paquete;
    
    IF NOT v_existe_paquete THEN
        RAISE EXCEPTION 'Error: El Paquete Turístico con código % no existe.', p_paquete_id;
    END IF;

    -- Agregar cada servicio
    FOREACH v_servicio_id IN ARRAY p_servicios_ids
    LOOP
        -- Validar si el servicio existe
        SELECT EXISTS(SELECT 1 FROM Servicio WHERE s_cod = v_servicio_id) INTO v_existe_servicio;

        IF NOT v_existe_servicio THEN
            RAISE NOTICE 'Advertencia: El Servicio % no existe en la base de datos. Se omitirá.', v_servicio_id;
        ELSE
            -- Validar si ya está asociado al paquete
            SELECT EXISTS(SELECT 1 FROM Paq_Ser WHERE paquete_turistico_pt_cod = p_paquete_id AND servicio_s_cod = v_servicio_id) INTO v_ya_asociado;

            IF v_ya_asociado THEN
                RAISE NOTICE 'Info: El Servicio % ya se encuentra asociado al Paquete.', v_servicio_id;
            ELSE
                -- Insertar la relación
                INSERT INTO Paq_Ser (paquete_turistico_pt_cod, servicio_s_cod)
                VALUES (p_paquete_id, v_servicio_id);
                
                RAISE NOTICE 'Servicio % agregado correctamente al Paquete %.', v_servicio_id, p_paquete_id;
            END IF;
        END IF;
    END LOOP;
    
    RAISE NOTICE 'Servicios agregados';
END;
$$;


-- PROCEDIMIENTO PARA QUITAR SERVICIOS A PAQUETE
CREATE OR REPLACE PROCEDURE sp_quitar_servicios_paquete(
    p_paquete_id INT,
    p_servicios_ids INT[]
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_servicio_id INT;
    v_existe_paquete BOOLEAN;
BEGIN
    -- Validar que el paquete exista
    SELECT EXISTS(SELECT 1 FROM Paquete_Turistico WHERE pt_cod = p_paquete_id) INTO v_existe_paquete;
    
    IF NOT v_existe_paquete THEN
        RAISE EXCEPTION 'Error: El Paquete Turístico con código % no existe.', p_paquete_id;
    END IF;

    -- Eliminar cada servicio
    FOREACH v_servicio_id IN ARRAY p_servicios_ids
    LOOP
        -- Intentar eliminar la relación
        DELETE FROM Paq_Ser 
        WHERE paquete_turistico_pt_cod = p_paquete_id 
          AND servicio_s_cod = v_servicio_id;

        -- Verificar si se eliminó alguna fila
        IF FOUND THEN
             RAISE NOTICE 'Servicio % desvinculado del Paquete %.', v_servicio_id, p_paquete_id;
        ELSE
             RAISE NOTICE 'Info: El Servicio % no estaba asociado al Paquete % (o no existe).', v_servicio_id, p_paquete_id;
        END IF;
    END LOOP;

    RAISE NOTICE 'Servicios eliminados del paquete.';
END;
$$;

-- FUNCION PARA OBTENER LOS SERVICIOS ASOCIADOS A UN PAQUETE
CREATE OR REPLACE FUNCTION fn_obtener_servicios_paquete(p_pt_cod INT)
RETURNS TABLE (
    cod_servicio INT
) AS $$
DECLARE
    v_paquete_existe BOOLEAN;
BEGIN
    -- Validar que el paquete existe
    SELECT EXISTS (SELECT 1 FROM Paquete_Turistico WHERE pt_cod = p_pt_cod) INTO v_paquete_existe;

    IF NOT v_paquete_existe THEN
        RAISE EXCEPTION 'No se ha encontrado el paquete turistico';
    END IF;

    -- Obtener servicios del paquete
    RETURN QUERY SELECT s.s_cod 
	FROM Servicio s, Paq_Ser ps 
	WHERE s.s_cod = ps.servicio_s_cod AND ps.paquete_turistico_pt_cod = p_pt_cod;

	RAISE NOTICE 'Servicios obtenidos';
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- MONTAJE Y COMPRA DE ITINERARIOS
-- ============================================================================
-- (PRIVADA) Función para obtener la Tasa de Cambio actual. Busca la tasa activa para una divisa (ej: USD)
CREATE OR REPLACE FUNCTION fn_obtener_tasa_actual(p_divisa VARCHAR)
RETURNS TABLE (
	cod_tasa INT,
	factor_tasa NUMERIC
) AS $$
BEGIN
    RETURN QUERY SELECT tca_cod, tca_valor_tasa
    FROM Tasa_Cambio
    WHERE tca_divisa_origen = p_divisa 
      AND tca_fecha_hora_fin IS NULL
    ORDER BY tca_fecha_hora_tasa DESC
    LIMIT 1;
END;
$$ LANGUAGE plpgsql;

-- (PRIVADA) Función para obtener el ID de la compra activa de un cliente. Retorna NULL si no tiene ninguna en proceso
CREATE OR REPLACE FUNCTION fn_obtener_compra_activa(p_cod_cliente INT)
RETURNS INT AS $$
DECLARE
    v_co_cod INT;
BEGIN
    SELECT co_cod INTO v_co_cod
    FROM Compra
    WHERE cliente_c_cod = p_cod_cliente 
      AND co_estado IN ('EN PROCESO', 'PAGANDO')
    LIMIT 1; -- Por si acaso LIMIT 1
    
    RETURN v_co_cod;
END;
$$ LANGUAGE plpgsql;

-- CREAR COMPRA (Itinerario o Paquete)
-- (PRIVADA) Crear compra tipo ITINERARIO (servicios individuales)
CREATE OR REPLACE FUNCTION fn_crear_compra_itinerario(p_cod_cliente INT) 
RETURNS INT AS $$
DECLARE
	v_cliente_cod INT;
	v_compra_cod INT;
BEGIN
    -- Validar que el cliente existe
    SELECT c.c_cod INTO v_cliente_cod FROM Cliente c WHERE c.c_cod = p_cod_cliente;

	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'No se encontro el cliente';
		RETURN NULL::INT;
	END IF;

    -- Validar que no haya compra EN PROCESO
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	
	IF v_compra_cod IS NOT NULL THEN
        RAISE NOTICE 'Cliente ya tiene una compra EN PROCESO o PAGANDO. Debe completarla o cancelarla primero';
        RETURN NULL::INT;
    END IF;

    -- Crear la compra
    INSERT INTO Compra (co_fecha_hora, co_monto_total, co_millas_a_agregar, co_estado, co_es_paquete, Cliente_c_cod)
    VALUES (NOW(), 0, 0, 'EN PROCESO', FALSE, v_cliente_cod)
    RETURNING co_cod INTO v_compra_cod;

	RAISE NOTICE 'Compra de Itinerario creada exitosamente. ID: %', v_compra_cod;
	RETURN v_cliente_cod;

EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Error al crear compra: %', SQLERRM;
	RETURN NULL::INT;
END;
$$ LANGUAGE plpgsql;

-- (PRIVADA) FUNCTION AUXILIAR: Buscar monto de promocion sobre un servicio
CREATE OR REPLACE FUNCTION fn_buscar_promocion_servicio(p_id_servicio INT)
RETURNS NUMERIC(12,2) AS $$
DECLARE
	v_monto_descuento NUMERIC;
BEGIN
	SELECT SUM(ps_monto) INTO v_monto_descuento FROM Pro_Ser WHERE Servicio_s_cod = p_id_servicio;
	RETURN v_monto_descuento;
END;
$$ LANGUAGE plpgsql;

-- AGREGAR SERVICIOS A COMPRA (Itinerario)
-- Agregar Vuelo a compra
CREATE OR REPLACE FUNCTION fn_agregar_vuelo_a_compra(
	p_cod_usuario INT,
    p_id_vuelo INT,
    p_cant_pasajeros INT,
    p_id_clase_asiento INT
) RETURNS BOOLEAN AS $$
DECLARE
    v_cliente_cod INT;
	v_compra_cod INT;
    v_costo_base NUMERIC(12,2);
	v_monto_descuento NUMERIC(12,2);
	v_sub_total NUMERIC(12,2);
	v_millas_agregar INT;
	v_estado_compra VARCHAR;
	v_es_paquete_compra BOOLEAN;
	v_factor_tasa NUMERIC;
	v_tasa_cambio_cod INT;
    v_vuelo_cod INT;
	v_costo_asiento NUMERIC(12,2);
    v_capacidad_disponible INT;
BEGIN
    -- Existe cliente
	SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Validar que la compra existe, si no, crearlo
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		SELECT * INTO v_compra_cod FROM fn_crear_compra_itinerario(v_cliente_cod);
	END IF;

	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'Error creando la compra';
		RETURN NULL::BOOLEAN;
	END IF;
    
	SELECT co_estado, co_es_paquete INTO v_estado_compra, v_es_paquete_compra FROM Compra WHERE co_cod = v_compra_cod;
	
	-- Validar si se esta pagando
	IF v_estado_compra = 'PAGANDO' THEN
		RAISE NOTICE 'La compra está pagándose, no se pueden agregar servicios';
		RETURN NULL::BOOLEAN;
	END IF;
    
	-- Validar que es compra de itinerario (no paquete)
    IF v_es_paquete_compra IS TRUE THEN
        RAISE NOTICE 'No se pueden agregar servicios para una compra de paquete. Cancelar compra del paquete o finalizarla.';
        RETURN NULL::BOOLEAN;
    END IF;

	-- Validar vuelo
    SELECT s_cod INTO v_vuelo_cod FROM Vuelo WHERE s_cod = p_id_vuelo;
    IF v_vuelo_cod IS NULL THEN
        RAISE NOTICE 'El vuelo no existe';
        RETURN NULL::BOOLEAN;
    END IF;
	
    -- Validar disponibilidad de asientos
    IF p_cant_pasajeros IS NULL OR p_cant_pasajeros <= 0 THEN
		RAISE NOTICE 'Colocar una cantidad de pasajeros valida';
		RETURN NULL::BOOLEAN;
	END IF;
	
	SELECT ac_cant_asientos, ca_costo INTO v_capacidad_disponible, v_costo_asiento
    FROM Aer_Cla, Clase_Asiento WHERE Clase_Asiento_ca_cod = p_id_clase_asiento
    AND Aeronave_mt_cod = (SELECT Aeronave_mt_cod FROM Vuelo WHERE s_cod = p_id_vuelo)
	AND ca_cod = Clase_Asiento_ca_cod;
	
	IF v_capacidad_disponible IS NULL THEN
		RAISE NOTICE 'No se encontro la clase de asiento para este vuelo';
		RETURN NULL::BOOLEAN;
	END IF;
	
    IF v_capacidad_disponible < p_cant_pasajeros THEN
        RAISE NOTICE 'No hay suficientes asientos disponibles';
        RETURN NULL::BOOLEAN;
    END IF;
    
	-- Validar que no exista duplicado
    IF EXISTS (SELECT 1 FROM Boleto_Vuelo WHERE Compra_co_cod = v_compra_cod AND Vuelo_s_cod = p_id_vuelo) THEN
        RAISE NOTICE 'Este vuelo ya se ha agregado a la compra';
        RETURN NULL::BOOLEAN;
	END IF;

    -- Obtener costo base del servicio
    SELECT s_costo INTO v_costo_base FROM Servicio WHERE s_cod = p_id_vuelo;
	
	-- Buscar las promociones del servicio
	SELECT * INTO v_monto_descuento FROM fn_buscar_promocion_servicio(p_id_vuelo);
	
	-- Calcular el subtotal
	v_sub_total := (v_costo_base * p_cant_pasajeros) + v_costo_asiento; 
	-- PUEDE DARSE EL CASO QUE EL DESCUENTO SOBREPASE EL MONTO TOTAL
	IF v_monto_descuento IS NOT NULL AND v_monto_descuento < v_sub_total THEN
		RAISE NOTICE 'Descuento menor al subtotal';
		v_sub_total := v_sub_total - v_monto_descuento;

		INSERT INTO Res_Pro_Ser (pro_ser_promocion_pr_cod, pro_ser_servicio_s_cod, boleto_vuelo_s_cod, boleto_vuelo_co_cod)
		SELECT promocion_pr_cod, servicio_s_cod, p_id_vuelo, v_compra_cod 
		FROM Pro_Ser WHERE servicio_s_cod = p_id_vuelo;
	END IF;

	-- Aplicar la tasa de cambio
	SELECT cod_tasa, factor_tasa INTO v_tasa_cambio_cod, v_factor_tasa
	FROM fn_obtener_tasa_actual('USD');
	
	v_sub_total := v_sub_total * COALESCE(v_factor_tasa, 1);
	
    -- Insertar boleto de vuelo
    INSERT INTO Boleto_Vuelo (Compra_co_cod, Vuelo_s_cod, res_costo_sub_total, res_anulado, bv_cant_pasajeros, Clase_Asiento_ca_cod, tasa_cambio_tca_cod)
    VALUES (v_compra_cod, p_id_vuelo, v_sub_total, FALSE, p_cant_pasajeros, p_id_clase_asiento, v_tasa_cambio_cod);
	
    -- Actualizar monto total de la compra
    SELECT s_millas_otorgar INTO v_millas_agregar FROM Servicio WHERE s_cod = p_id_vuelo;

    UPDATE Compra SET co_monto_total = co_monto_total + v_sub_total, co_millas_a_agregar = co_millas_a_agregar + v_millas_agregar
	WHERE co_cod = v_compra_cod;

    RAISE NOTICE 'Vuelo agregado a la compra exitosamente';
    RETURN TRUE;

EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Error al agregar vuelo: %', SQLERRM;
    RETURN NULL::BOOLEAN;
END;
$$ LANGUAGE plpgsql;

-- Agregar viaje a compra
CREATE OR REPLACE FUNCTION fn_agregar_viaje_a_compra(
    p_cod_usuario INT,
	p_id_viaje INT,
    p_cant_pasajeros INT,
    p_id_tipo_camarote INT,
	p_id_servicio_barco INT DEFAULT NULL
) RETURNS BOOLEAN AS $$
DECLARE
    v_cliente_cod INT;
	v_compra_cod INT;
    v_costo_base NUMERIC(12,2);
	v_monto_descuento NUMERIC(12,2);
	v_sub_total NUMERIC(12,2);
	v_millas_agregar INT;
	v_estado_compra VARCHAR;
	v_es_paquete_compra BOOLEAN;	
	v_factor_tasa NUMERIC;
	v_tasa_cambio_cod INT;	
    v_viaje_cod INT;
	v_capacidad_camarote INT;
	v_costo_camarote NUMERIC(12,2);
	v_costo_servicio NUMERIC(12,2) DEFAULT NULL;
BEGIN
    -- Validaciones básicas
    SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Validar que la compra existe, si no, crearlo
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		SELECT * INTO v_compra_cod FROM fn_crear_compra_itinerario(v_cliente_cod);
	END IF;

	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'Error creando la compra';
		RETURN NULL::BOOLEAN;
	END IF;
    
	SELECT co_estado, co_es_paquete INTO v_estado_compra, v_es_paquete_compra FROM Compra WHERE co_cod = v_compra_cod;
	
	-- Validar si se esta pagando
	IF v_estado_compra = 'PAGANDO' THEN
		RAISE NOTICE 'La compra está pagándose, no se pueden agregar servicios';
		RETURN NULL::BOOLEAN;
	END IF;
    
	-- Validar que es compra de itinerario (no paquete)
    IF v_es_paquete_compra IS TRUE THEN
        RAISE NOTICE 'No se pueden agregar servicios para una compra de paquete. Cancelar compra del paquete o finalizarla.';
        RETURN NULL::BOOLEAN;
    END IF;

	-- Validar viaje
    SELECT s_cod INTO v_viaje_cod FROM Viaje WHERE s_cod = p_id_viaje;
    IF v_viaje_cod IS NULL THEN
        RAISE NOTICE 'El viaje no existe';
        RETURN NULL::BOOLEAN;
    END IF;

    IF EXISTS (SELECT 1 FROM Boleto_Viaje WHERE Compra_co_cod = v_compra_cod AND Viaje_s_cod = p_id_viaje) THEN
        RAISE NOTICE 'Este viaje ya ha sido agregado';
        RETURN NULL::BOOLEAN;
    END IF;
	
	-- Validar tipo camarote y su capacidad
	IF p_cant_pasajeros IS NULL OR p_cant_pasajeros <= 0 THEN
		RAISE NOTICE 'Colocar una cantidad de pasajeros valida';
		RETURN NULL::BOOLEAN;
	END IF;
	
	SELECT tc_capacidad, tc_costo INTO v_capacidad_camarote, v_costo_camarote
	FROM Bar_Tip, Tipo_Camarote 
	WHERE tc_cod = p_id_tipo_camarote
	AND tc_cod = tipo_camarote_tc_cod
    AND Barco_mt_cod = (SELECT Barco_mt_cod FROM Viaje WHERE s_cod = p_id_viaje);
	
	IF v_capacidad_camarote IS NULL THEN
		RAISE NOTICE 'El tipo de camarote indicado no pertenece al barco del viaje';
		RETURN NULL::BOOLEAN;
	END IF;
	
	IF v_capacidad_camarote < p_cant_pasajeros THEN
		RAISE NOTICE 'La cantidad de pasajeros sobrepasa el camarote indicado';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Validar servicio barco
	IF p_id_servicio_barco IS NOT NULL THEN
		SELECT sb_costo INTO v_costo_servicio FROM Bar_Ser, Servicio_Barco 
		WHERE sb_cod = p_id_servicio_barco 
		AND sb_cod = servicio_barco_sb_cod 
		AND barco_mt_cod = (SELECT barco_mt_cod FROM Viaje WHERE s_cod = p_id_viaje);
		
		IF v_costo_servicio IS NULL THEN
			RAISE NOTICE 'El servicio del barco no está disponible';
			RETURN NULL::BOOLEAN;
		END IF;
	END IF;
	
    -- Buscar costo base
	SELECT s_costo INTO v_costo_base FROM Servicio WHERE s_cod = p_id_viaje;
	
	-- Buscar las promociones del servicio
	SELECT * INTO v_monto_descuento FROM fn_buscar_promocion_servicio(p_id_viaje);

    v_sub_total := (v_costo_base * p_cant_pasajeros) + v_costo_camarote;
	IF v_costo_servicio IS NOT NULL THEN
		v_sub_total := v_sub_total + v_costo_servicio;
	END IF;
	IF v_monto_descuento IS NOT NULL AND v_monto_descuento < v_sub_total THEN
		RAISE NOTICE 'Descuento menor al subtotal';
		v_sub_total := v_sub_total - v_monto_descuento;

		INSERT INTO Res_Pro_Ser (pro_ser_promocion_pr_cod, pro_ser_servicio_s_cod, boleto_viaje_s_cod, boleto_viaje_co_cod)
		SELECT promocion_pr_cod, servicio_s_cod, p_id_viaje, v_compra_cod 
		FROM Pro_Ser WHERE servicio_s_cod = p_id_viaje;
	END IF;

	-- Aplicar la tasa de cambio
	SELECT cod_tasa, factor_tasa INTO v_tasa_cambio_cod, v_factor_tasa
	FROM fn_obtener_tasa_actual('USD');
	
	v_sub_total := v_sub_total * COALESCE(v_factor_tasa, 1);
		
    INSERT INTO Boleto_Viaje (Compra_co_cod, Viaje_s_cod, res_costo_sub_total, res_anulado, bvi_cant_pasajeros, Tipo_Camarote_tc_cod, servicio_barco_sb_cod, tasa_cambio_tca_cod)
    VALUES (v_compra_cod, p_id_viaje, v_sub_total, FALSE, p_cant_pasajeros, p_id_tipo_camarote, p_id_servicio_barco, v_tasa_cambio_cod);

    SELECT s_millas_otorgar INTO v_millas_agregar FROM Servicio WHERE s_cod = p_id_viaje;

    UPDATE Compra SET co_monto_total = co_monto_total + v_sub_total, co_millas_a_agregar = co_millas_a_agregar + v_millas_agregar
	WHERE co_cod = v_compra_cod;

    RAISE NOTICE 'Viaje agregado a la compra exitosamente';
    RETURN TRUE;

EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Error al agregar viaje: %', SQLERRM;
    RETURN NULL::BOOLEAN;
END;
$$ LANGUAGE plpgsql;

-- Agregar Habitacion a compra
CREATE OR REPLACE FUNCTION fn_agregar_habitacion_a_compra(
    p_cod_usuario INT,
	p_id_habitacion INT,
    p_cant_noches INT,
    p_fecha_check_in TIMESTAMP
) RETURNS BOOLEAN AS $$
DECLARE
    v_cliente_cod INT;
	v_compra_cod INT;
    v_costo_base NUMERIC(12,2);
	v_monto_descuento NUMERIC(12,2);
	v_sub_total NUMERIC(12,2);
	v_millas_agregar INT;
	v_estado_compra VARCHAR;
	v_es_paquete_compra BOOLEAN;	
	v_factor_tasa NUMERIC;
	v_tasa_cambio_cod INT;	
    v_habitacion_cod INT;
    v_fecha_check_out TIMESTAMP;
BEGIN
    -- Validaciones básicas
    SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Validar que la compra existe, si no, crearlo
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		SELECT * INTO v_compra_cod FROM fn_crear_compra_itinerario(v_cliente_cod);
	END IF;

	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'Error creando la compra';
		RETURN NULL::BOOLEAN;
	END IF;
    
	SELECT co_estado, co_es_paquete INTO v_estado_compra, v_es_paquete_compra FROM Compra WHERE co_cod = v_compra_cod;
	
	-- Validar si se esta pagando
	IF v_estado_compra = 'PAGANDO' THEN
		RAISE NOTICE 'La compra está pagándose, no se pueden agregar servicios';
		RETURN NULL::BOOLEAN;
	END IF;
    
	-- Validar que es compra de itinerario (no paquete)
    IF v_es_paquete_compra IS TRUE THEN
        RAISE NOTICE 'No se pueden agregar servicios para una compra de paquete. Cancelar compra del paquete o finalizarla.';
        RETURN NULL::BOOLEAN;
    END IF;

	-- Validar habitacion
    SELECT s_cod INTO v_habitacion_cod FROM Habitacion WHERE s_cod = p_id_habitacion;
    IF v_habitacion_cod IS NULL THEN
        RAISE NOTICE 'La habitacion no existe';
        RETURN NULL::BOOLEAN;
    END IF;

    IF EXISTS (SELECT 1 FROM Detalle_Hospedaje WHERE Compra_co_cod = v_compra_cod AND habitacion_s_cod = p_id_habitacion) THEN
        RAISE NOTICE 'Esta habitacion ya ha sido agregado';
        RETURN NULL::BOOLEAN;
    END IF;

    -- Validar fechas
    IF p_cant_noches <= 0 THEN
        RAISE NOTICE 'La cantidad de noches debe ser mayor a 0';
        RETURN NULL::BOOLEAN;
    END IF;
	
	IF p_fecha_check_in < CURRENT_TIMESTAMP THEN
		RAISE NOTICE 'La fecha de check in no puede ser antes que hoy';
		RETURN NULL::BOOLEAN;
	END IF;
	
    v_fecha_check_out := p_fecha_check_in + (p_cant_noches || ' days')::INTERVAL;

    SELECT s_costo INTO v_costo_base FROM Servicio WHERE s_cod = p_id_habitacion;
	
	-- Buscar las promociones del servicio
	SELECT * INTO v_monto_descuento FROM fn_buscar_promocion_servicio(p_id_habitacion);
	
	v_sub_total := v_costo_base * p_cant_noches;
	IF v_monto_descuento IS NOT NULL AND v_monto_descuento < v_sub_total THEN
		RAISE NOTICE 'Descuento menor al subtotal';
		v_sub_total := v_sub_total - v_monto_descuento;

		INSERT INTO Res_Pro_Ser (pro_ser_promocion_pr_cod, pro_ser_servicio_s_cod, detalle_hospedaje_s_cod, detalle_hospedaje_co_cod)
		SELECT promocion_pr_cod, servicio_s_cod, p_id_habitacion, v_compra_cod 
		FROM Pro_Ser WHERE servicio_s_cod = p_id_habitacion;
	END IF;

	-- Aplicar la tasa de cambio
	SELECT cod_tasa, factor_tasa INTO v_tasa_cambio_cod, v_factor_tasa
	FROM fn_obtener_tasa_actual('USD');
	
	v_sub_total := v_sub_total * COALESCE(v_factor_tasa, 1);
	
    INSERT INTO Detalle_Hospedaje (Compra_co_cod, Habitacion_s_cod, res_costo_sub_total, res_anulado, dh_cant_noches, dh_fecha_hora_check_in, dh_fecha_hora_check_out, tasa_cambio_tca_cod)
    VALUES (v_compra_cod, p_id_habitacion, v_sub_total, FALSE, p_cant_noches, p_fecha_check_in, v_fecha_check_out, v_tasa_cambio_cod);

    SELECT s_millas_otorgar INTO v_millas_agregar FROM Servicio WHERE s_cod = p_id_habitacion;

    UPDATE Compra SET co_monto_total = co_monto_total + v_sub_total, co_millas_a_agregar = co_millas_a_agregar + v_millas_agregar
	WHERE co_cod = v_compra_cod;

    RAISE NOTICE 'Habitacion agregado a la compra exitosamente';
    RETURN TRUE;

EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Error al agregar habitacion: %', SQLERRM;
    RETURN NULL::BOOLEAN;
END;
$$ LANGUAGE plpgsql;

-- Agregar Traslado a compra
CREATE OR REPLACE FUNCTION fn_agregar_traslado_a_compra(
	p_cod_usuario INT,
    p_id_traslado INT,
    p_id_automovil INT,
    p_fecha_traslado TIMESTAMP
) RETURNS BOOLEAN AS $$
DECLARE
    v_cliente_cod INT;
	v_compra_cod INT;
    v_costo_base NUMERIC(12,2);
	v_monto_descuento NUMERIC(12,2);
	v_sub_total NUMERIC(12,2);
	v_millas_agregar INT;
	v_estado_compra VARCHAR;
	v_es_paquete_compra BOOLEAN;
	v_factor_tasa NUMERIC;
	v_tasa_cambio_cod INT;	
    v_traslado_cod INT;
	v_costo_vehiculo NUMERIC(12,2);
	v_distancia_traslado NUMERIC(10);
	
BEGIN
    -- Validaciones básicas
    SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Validar que la compra existe, si no, crearlo
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		SELECT * INTO v_compra_cod FROM fn_crear_compra_itinerario(v_cliente_cod);
	END IF;

	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'Error creando la compra';
		RETURN NULL::BOOLEAN;
	END IF;
    
	SELECT co_estado, co_es_paquete INTO v_estado_compra, v_es_paquete_compra FROM Compra WHERE co_cod = v_compra_cod;
	
	-- Validar si se esta pagando
	IF v_estado_compra = 'PAGANDO' THEN
		RAISE NOTICE 'La compra está pagándose, no se pueden agregar servicios';
		RETURN NULL::BOOLEAN;
	END IF;
    
	-- Validar que es compra de itinerario (no paquete)
    IF v_es_paquete_compra IS TRUE THEN
        RAISE NOTICE 'No se pueden agregar servicios para una compra de paquete. Cancelar compra del paquete o finalizarla.';
        RETURN NULL::BOOLEAN;
    END IF;

	-- Validar traslado
    SELECT s_cod INTO v_traslado_cod FROM Traslado WHERE s_cod = p_id_traslado;
    IF v_traslado_cod IS NULL THEN
        RAISE NOTICE 'El traslado no existe';
        RETURN NULL::BOOLEAN;
    END IF;

    IF EXISTS (SELECT 1 FROM Detalle_Traslado WHERE Compra_co_cod = v_compra_cod AND traslado_s_cod = p_id_traslado) THEN
        RAISE NOTICE 'Este traslado ya ha sido agregado';
        RETURN NULL::BOOLEAN;
    END IF;
	
	-- Validar fecha del traslado
	IF p_fecha_traslado < CURRENT_TIMESTAMP THEN
		RAISE NOTICE 'La fecha de traslado no puede ser antes que hoy';
		RETURN NULL::BOOLEAN;
	END IF;
	
	SELECT t_distancia_km INTO v_distancia_traslado FROM Traslado WHERE s_cod = p_id_traslado;
	
	-- Validar el vehiculo elegido
	SELECT a.a_costo_por_km INTO v_costo_vehiculo FROM Automovil a
	WHERE a.mt_cod = p_id_automovil AND a.transporte_terrestre_p_cod = (SELECT tt.p_cod FROM Transporte_Terrestre tt, Traslado tr WHERE tt.p_cod = transporte_terrestre_p_cod AND tr.s_cod = p_id_traslado);
	
	IF v_costo_vehiculo IS NULL THEN
		RAISE NOTICE 'El vehiculo elegido no es valido';
		RETURN NULL::BOOLEAN;
	END IF;
    
	SELECT s_costo INTO v_costo_base FROM Servicio WHERE s_cod = p_id_traslado;
	
	-- Buscar las promociones del servicio
	SELECT * INTO v_monto_descuento FROM fn_buscar_promocion_servicio(p_id_traslado);
	
	v_sub_total := v_costo_base + (v_costo_vehiculo * v_distancia_traslado);
	IF v_monto_descuento IS NOT NULL AND v_monto_descuento < v_sub_total THEN
		RAISE NOTICE 'Descuento menor al subtotal';
		v_sub_total := v_sub_total - v_monto_descuento;

		INSERT INTO Res_Pro_Ser (pro_ser_promocion_pr_cod, pro_ser_servicio_s_cod, detalle_traslado_s_cod, detalle_traslado_co_cod)
		SELECT promocion_pr_cod, servicio_s_cod, p_id_traslado, v_compra_cod 
		FROM Pro_Ser WHERE servicio_s_cod = p_id_traslado;
	END IF;

	-- Aplicar la tasa de cambio
	SELECT cod_tasa, factor_tasa INTO v_tasa_cambio_cod, v_factor_tasa
	FROM fn_obtener_tasa_actual('USD');
	
	v_sub_total := v_sub_total * COALESCE(v_factor_tasa, 1);
	
    INSERT INTO Detalle_Traslado (Compra_co_cod, Traslado_s_cod, res_costo_sub_total, res_anulado, dt_fecha_hora, Automovil_mt_cod, tasa_cambio_tca_cod)
    VALUES (v_compra_cod, p_id_traslado, v_sub_total, FALSE, p_fecha_traslado, p_id_automovil, v_tasa_cambio_cod);

    SELECT s_millas_otorgar INTO v_millas_agregar FROM Servicio WHERE s_cod = p_id_traslado;

    UPDATE Compra SET co_monto_total = co_monto_total + v_sub_total, co_millas_a_agregar = co_millas_a_agregar + v_millas_agregar
	WHERE co_cod = v_compra_cod;

    RAISE NOTICE 'Traslado agregado a la compra exitosamente';
    RETURN TRUE;

EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Error al agregar traslado: %', SQLERRM;
    RETURN NULL::BOOLEAN;
END;
$$ LANGUAGE plpgsql;

-- Agregar Servicio Adicional (Entrada Digital) a compra
CREATE OR REPLACE FUNCTION fn_agregar_entrada_digital_a_compra(
    p_cod_usuario INT,
    p_id_servicio_adicional INT,
    p_cant_personas INT
) RETURNS BOOLEAN AS $$
DECLARE
    v_cliente_cod INT;
	v_compra_cod INT;
    v_costo_base NUMERIC(12,2);
	v_monto_descuento NUMERIC(12,2);
	v_sub_total NUMERIC(12,2);
	v_millas_agregar BIGINT;
	v_estado_compra VARCHAR;
	v_es_paquete_compra BOOLEAN;
	v_factor_tasa NUMERIC;
	v_tasa_cambio_cod INT;	
    v_servicio_ad_cod INT;
BEGIN
    -- Validaciones básicas
    SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Validar que la compra existe, si no, crearlo
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		SELECT * INTO v_compra_cod FROM fn_crear_compra_itinerario(v_cliente_cod);
	END IF;

	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'Error creando la compra';
		RETURN NULL::BOOLEAN;
	END IF;

	SELECT co_estado, co_es_paquete INTO v_estado_compra, v_es_paquete_compra FROM Compra WHERE co_cod = v_compra_cod;
	
	-- Validar si se esta pagando
	IF v_estado_compra = 'PAGANDO' THEN
		RAISE NOTICE 'La compra está pagándose, no se pueden agregar servicios';
		RETURN NULL::BOOLEAN;
	END IF;
    
	-- Validar que es compra de itinerario (no paquete)
    IF v_es_paquete_compra IS TRUE THEN
        RAISE NOTICE 'No se pueden agregar servicios para una compra de paquete. Cancelar compra del paquete o finalizarla.';
        RETURN NULL::BOOLEAN;
    END IF;

	-- Validar entrada digital
    SELECT s_cod INTO v_servicio_ad_cod FROM Servicio_Adicional WHERE s_cod = p_id_servicio_adicional;
    IF v_servicio_ad_cod IS NULL THEN
        RAISE NOTICE 'El servicio adicional no existe';
        RETURN NULL::BOOLEAN;
    END IF;

    IF EXISTS (SELECT 1 FROM Entrada_Digital WHERE Compra_co_cod = v_compra_cod AND servicio_adicional_s_cod = p_id_servicio_adicional) THEN
        RAISE NOTICE 'Este traslado ya ha sido agregado';
        RETURN NULL::BOOLEAN;
    END IF;
	
	IF p_cant_personas IS NULL OR p_cant_personas <= 0 THEN
		RAISE NOTICE 'No pueden ser 0 personas';
		RETURN NULL::BOOLEAN;
	END IF;
	
	IF p_cant_personas > (SELECT sa_capacidad FROM Servicio_Adicional WHERE s_cod = p_id_servicio_adicional) THEN
		RAISE NOTICE 'El servicio adicional no tiene capacidad para esta cantidad de personas';
		RETURN NUULL::BOOLEAN;
	END IF;

    SELECT s_costo INTO v_costo_base FROM Servicio WHERE s_cod = p_id_servicio_adicional;
    
	-- Buscar las promociones del servicio
	SELECT * INTO v_monto_descuento FROM fn_buscar_promocion_servicio(p_id_servicio_adicional);
	
	v_sub_total := v_costo_base * p_cant_personas;
	IF v_monto_descuento IS NOT NULL AND v_monto_descuento < v_sub_total THEN
		RAISE NOTICE 'Descuento menor al subtotal';
		v_sub_total := v_sub_total - v_monto_descuento;

		INSERT INTO Res_Pro_Ser (pro_ser_promocion_pr_cod, pro_ser_servicio_s_cod, entrada_digital_s_cod, entrada_digital_co_cod)
		SELECT promocion_pr_cod, servicio_s_cod, p_id_servicio_adicional, v_compra_cod 
		FROM Pro_Ser WHERE servicio_s_cod = p_id_servicio_adicional;
	END IF;

	-- Aplicar la tasa de cambio
	SELECT cod_tasa, factor_tasa INTO v_tasa_cambio_cod, v_factor_tasa
	FROM fn_obtener_tasa_actual('USD');
	
	v_sub_total := v_sub_total * COALESCE(v_factor_tasa, 1);

    INSERT INTO Entrada_Digital (Compra_co_cod, Servicio_Adicional_s_cod, res_costo_sub_total, res_anulado, ed_cant_personas, tasa_cambio_tca_cod)
    VALUES (v_compra_cod, p_id_servicio_adicional, v_sub_total, FALSE, p_cant_personas, v_tasa_cambio_cod);

	SELECT s_millas_otorgar INTO v_millas_agregar FROM Servicio WHERE s_cod = p_id_servicio_adicional;

    UPDATE Compra SET co_monto_total = co_monto_total + v_sub_total, co_millas_a_agregar = co_millas_a_agregar + v_millas_agregar
	WHERE co_cod = v_compra_cod;

    RAISE NOTICE 'Servicio adicional agregado a la compra exitosamente';
    RETURN TRUE;

EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Error al agregar servicio adicional: %', SQLERRM;
    RETURN NULL::BOOLEAN;
END;
$$ LANGUAGE plpgsql;

-- Cancelar compra EN PROCESO
CREATE OR REPLACE FUNCTION fn_cancelar_compra(p_cod_usuario INT) 
RETURNS BOOLEAN AS $$
DECLARE
    v_cliente_cod INT;
	v_compra_cod INT;
    v_estado_compra VARCHAR;
	v_contador INT := 0;
BEGIN
    SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Buscar la compra activa
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'No hay ninguna compra activa para este cliente';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Validar si se esta pagando
	SELECT co_estado INTO v_estado_compra FROM Compra WHERE co_cod = v_compra_cod;
	IF v_estado_compra = 'PAGANDO' THEN
		RAISE NOTICE 'La compra está pagándose, no se puede cancelar';
		RETURN NULL::BOOLEAN;
	END IF;
	
    -- Eliminar todas las reservas asociadas y viajeros
    v_contador := v_contador + (SELECT COUNT(*) FROM Boleto_Vuelo WHERE Compra_co_cod = v_compra_cod);
    DELETE FROM Boleto_Vuelo WHERE Compra_co_cod = v_compra_cod;
	RAISE NOTICE 'Boletos de vuelos eliminados. Eliminaciones totales: %', v_contador;

    v_contador := v_contador + (SELECT COUNT(*) FROM Boleto_Viaje WHERE Compra_co_cod = v_compra_cod);
    DELETE FROM Boleto_Viaje WHERE Compra_co_cod = v_compra_cod;
	RAISE NOTICE 'Boletos de viajes eliminados. Eliminaciones totales: %', v_contador;

    v_contador := v_contador + (SELECT COUNT(*) FROM Detalle_Hospedaje WHERE Compra_co_cod = v_compra_cod);
    DELETE FROM Detalle_Hospedaje WHERE Compra_co_cod = v_compra_cod;
	RAISE NOTICE 'Hospedajes eliminados. Eliminaciones totales: %', v_contador;

    v_contador := v_contador + (SELECT COUNT(*) FROM Detalle_Traslado WHERE Compra_co_cod = v_compra_cod);
    DELETE FROM Detalle_Traslado WHERE Compra_co_cod = v_compra_cod;
	RAISE NOTICE 'Traslados eliminados. Eliminaciones totales: %', v_contador;

    v_contador := v_contador + (SELECT COUNT(*) FROM Entrada_Digital WHERE Compra_co_cod = v_compra_cod);
    DELETE FROM Entrada_Digital WHERE Compra_co_cod = v_compra_cod;
	RAISE NOTICE 'Entradas digitales eliminadas. Eliminaciones totales: %', v_contador;

	DELETE FROM Via_Res WHERE boleto_vuelo_co_cod = v_compra_cod 
	OR detalle_traslado_co_cod = v_compra_cod 
	OR boleto_viaje_co_cod = v_compra_cod 
	OR entrada_digital_co_cod = v_compra_cod 
	OR detalle_hospedaje_co_cod = v_compra_cod; 
	
    -- Eliminar la compra
    DELETE FROM Compra WHERE co_cod = v_compra_cod;

	RAISE NOTICE 'Compra cancelada. Se eliminaron % reservas', v_contador;
    RETURN TRUE;

EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Error al cancelar la compra: %', SQLERRM;
	RETURN NULL::BOOLEAN;
END;
$$ LANGUAGE plpgsql;

-- PROCESAMIENTO DE PAGO Y FINALIZACION
-- (PRIVADA) Calcular millas a agregar por compra
CREATE OR REPLACE FUNCTION fn_calcular_millas_compra(p_id_compra INT) 
RETURNS INT AS $$
DECLARE
    v_km_total INT;
	v_millas_total INT;
BEGIN
    v_km_total := 0;

	v_km_total := v_km_total + 
	COALESCE(
		(SELECT SUM(v_distancia_km) FROM Vuelo 
		WHERE s_cod = (SELECT vuelo_s_cod FROM Boleto_Vuelo WHERE compra_co_cod = p_id_compra))
	, 0) + 
	COALESCE(
		(SELECT SUM(t_distancia_km) FROM Traslado 
		WHERE s_cod = (SELECT traslado_s_cod FROM Detalle_Traslado WHERE compra_co_cod = p_id_compra))
	, 0) + 
	COALESCE(
		(SELECT SUM(vi_distancia_km) FROM Viaje 
		WHERE s_cod = (SELECT viaje_s_cod FROM Boleto_Viaje WHERE compra_co_cod = p_id_compra))
	, 0);

	v_millas_total := v_km_total / 10;

	RETURN v_millas_total;
	
EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Error calculando millas: %', SQLERRM;
	RETURN 0;
END;
$$ LANGUAGE plpgsql;

-- VALIDAR LOS MONTOS DE PAGOS A PROCESAR PARA UNA COMPRA
CREATE OR REPLACE FUNCTION fn_validar_montos(
	p_cod_usuario INT,
	p_montos NUMERIC[],
	p_es_financiada BOOLEAN DEFAULT FALSE,
	p_monto_huella NUMERIC DEFAULT 0
)
RETURNS BOOLEAN AS $$
DECLARE
	v_cliente_cod INT;
	v_compra_cod INT;
	v_estado_compra VARCHAR;
	v_es_paquete_compra BOOLEAN;
	v_monto_a_pagar NUMERIC(15,2);
	v_monto_pagado NUMERIC(15,2);
	v_monto NUMERIC(12,2);
BEGIN
	IF ARRAY_LENGTH(p_montos, 1) IS NULL THEN
		RAISE NOTICE 'Indicar al menos un monto';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Existe cliente
	SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Validar que la compra existe
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'No hay ninguna compra EN PROCESO o PAGANDO';
		RETURN NULL::BOOLEAN;
	END IF;

	SELECT co_estado, co_es_paquete, co_monto_total 
	INTO v_estado_compra, v_es_paquete_compra, v_monto_a_pagar
	FROM Compra WHERE co_cod = v_compra_cod;
	
	-- Validar si es PAGANDO
	IF v_estado_compra = 'PAGANDO' THEN
		RAISE NOTICE 'La compra es PAGANDO.';
		RETURN NULL::BOOLEAN;
	END IF;
    
	-- Validar que es compra de itinerario (no paquete)
    IF v_es_paquete_compra IS TRUE THEN
        RAISE NOTICE 'La compra de paquete se paga con millas.';
        RETURN NULL::BOOLEAN;
    END IF;	

	-- Revisar si se financia, el monto a pagar sera el 10% inicial
	IF p_es_financiada IS TRUE THEN
		v_monto_a_pagar := v_monto_a_pagar * 0.10;
	END IF;
	
	-- Mas el monto colocado para la compensacion
	v_monto_a_pagar := v_monto_a_pagar + p_monto_huella;
	
	v_monto_pagado := 0;
	
	FOREACH v_monto IN ARRAY p_montos LOOP
		v_monto_pagado := v_monto_pagado + v_monto;
		IF v_monto_pagado > v_monto_a_pagar THEN
			RAISE NOTICE 'Los montos de los pagos sobrepasan el monto total';
			RETURN FALSE;
		END IF;
	END LOOP;

	IF v_monto_pagado = v_monto_a_pagar THEN
		RAISE NOTICE 'Montos adecuados para pagar';
		RETURN TRUE;
	ELSE
		RAISE NOTICE 'Montos insuficientes para pagar';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql;

-- (PRIVADA) Funcion para revisar si ya se cumplio con el monto y cambiar a finalizado
CREATE OR REPLACE PROCEDURE sp_validar_pagos(p_compra_cod INT, p_es_financiada BOOLEAN)
AS $$
DECLARE
	v_monto_a_pagar NUMERIC(15,2);
	v_monto_huella NUMERIC(12,2);
	v_monto_pagado NUMERIC(15,2);
	v_estado_nuevo VARCHAR;
	v_millas_agregar BIGINT;
	v_cliente_cod INT;
BEGIN
	SELECT co_monto_total, co_compensacion_huella 
	INTO v_monto_a_pagar, v_monto_huella 
	FROM Compra WHERE co_cod = p_compra_cod;

	IF v_monto_huella IS NULL THEN
		v_monto_huella := 0;
	END IF;
	
	IF p_es_financiada IS TRUE THEN
		v_monto_a_pagar := v_monto_a_pagar * 0.10;
	END IF;

	v_monto_a_pagar := v_monto_a_pagar + v_monto_huella;

	SELECT SUM(pa_monto) INTO v_monto_pagado FROM Pago WHERE compra_co_cod = p_compra_cod;

	IF v_monto_pagado IS NULL OR v_monto_pagado < v_monto_a_pagar THEN
		RETURN;
	END IF;

	IF p_es_financiada IS TRUE THEN
		v_estado_nuevo := 'FINANCIADO';
	ELSE
		v_estado_nuevo := 'FINALIZADO';
	END IF;

	-- Recoger las millas a agregar y otorgarlas
	SELECT co_millas_a_agregar INTO v_millas_agregar FROM Compra WHERE co_cod = p_compra_cod;
	v_millas_agregar := v_millas_agregar + (SELECT * FROM fn_calcular_millas_compra(p_compra_cod));

	SELECT c_cod INTO v_cliente_cod FROM Cliente, Compra WHERE c_cod = cliente_c_cod AND co_cod = p_compra_cod;

	UPDATE Metodo_Pago SET m_cant_acumulada = m_cant_acumulada + v_millas_agregar WHERE m_cliente_cod = v_cliente_cod;

	-- Actualizar el estado de la compra
	UPDATE Compra SET co_estado = v_estado_nuevo WHERE co_cod = p_compra_cod;
	RAISE NOTICE 'Pagos concretaron la compra';
END;
$$ LANGUAGE plpgsql;

-- FUNCIONES PARA PAGAR POR CADA TIPO DE METODO DE PAGO
CREATE OR REPLACE FUNCTION fn_pago_tarjeta(
	p_cod_usuario INT,
	p_monto NUMERIC(12,2),
	p_tarj_numero BIGINT,
	p_tarj_cod_seguridad INT,
	p_tarj_nombre_titular VARCHAR,
	p_tarj_fecha_venc DATE,
	p_tarj_banco_cod INT,
	p_tarj_emisor VARCHAR
) RETURNS BOOLEAN AS $$
DECLARE
	v_compra_cod INT;
	v_cliente_cod INT;
	v_estado_compra VARCHAR;
	v_es_paquete_compra BOOLEAN;
	v_es_financiada BOOLEAN;
	v_mp_cod INT;
BEGIN
	-- Validar monto
	IF p_monto IS NULL OR p_monto <= 0 THEN
		RAISE NOTICE 'El monto debe ser positivo';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Existe cliente
	SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Validar que la compra existe
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'No hay ninguna compra EN PROCESO o PAGANDO';
		RETURN NULL::BOOLEAN;
	END IF;

	SELECT co_estado, co_es_paquete 
	INTO v_estado_compra, v_es_paquete_compra 
	FROM Compra WHERE co_cod = v_compra_cod;

	-- Validar que es compra de itinerario (no paquete)
    IF v_es_paquete_compra IS TRUE THEN
        RAISE NOTICE 'Los paquetes se pagan solo con MILLA.';
        RETURN NULL::BOOLEAN;
    END IF;
	
	-- Validar si se esta pagando
	IF v_estado_compra = 'EN PROCESO' THEN
		RAISE NOTICE 'La compra sigue EN PROCESO. No se puede pagar';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Revisar si se financia
	v_es_financiada := FALSE;
	IF EXISTS (SELECT 1 FROM Cuota WHERE compra_co_cod = v_compra_cod) THEN
		v_es_financiada := TRUE;
	END IF;

	IF NOT EXISTS (SELECT 1 FROM Banco WHERE ba_cod = p_tarj_banco_cod) THEN
		RAISE NOTICE 'El codigo del banco no existe';
		RETURN NULL::BOOLEAN;
	END IF;
	
	INSERT INTO Metodo_Pago (cliente_c_cod, t_numero, t_cod_seguridad, t_nombre_titular, t_fecha_vencimiento, t_banco_cod, t_emisor, mp_tipo)
	VALUES (v_cliente_cod, p_tarj_numero, p_tarj_cod_seguridad, p_tarj_nombre_titular, p_tarj_fecha_venc, p_tarj_banco_cod, p_tarj_emisor, 'TARJETA')
	RETURNING mp_cod INTO v_mp_cod;
	RAISE NOTICE 'Metodo de pago creado';

	INSERT INTO Pago VALUES (p_monto, CURRENT_TIMESTAMP, v_compra_cod, v_mp_cod);
	RAISE NOTICE 'Pago creado';

	-- Validar si ya completa la compra
	CALL sp_validar_pagos(v_compra_cod, v_es_financiada);
	
	RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_pago_cheque(
	p_cod_usuario INT,
	p_monto NUMERIC(12,2),
	p_cheq_cod_cuenta BIGINT,
	p_cheq_numero BIGINT,
	p_cheq_nombre_titular VARCHAR(50),
	p_cheq_fecha_emision DATE,
	p_cheq_banco_cod INT
) RETURNS BOOLEAN AS $$
DECLARE
	v_compra_cod INT;
	v_cliente_cod INT;
	v_estado_compra VARCHAR;
	v_es_paquete_compra BOOLEAN;
	v_es_financiada BOOLEAN;
	v_mp_cod INT;
BEGIN
	-- Validar monto
	IF p_monto IS NULL OR p_monto <= 0 THEN
		RAISE NOTICE 'El monto debe ser positivo';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Existe cliente
	SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Validar que la compra existe
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'No hay ninguna compra EN PROCESO o PAGANDO';
		RETURN NULL::BOOLEAN;
	END IF;

	SELECT co_estado, co_es_paquete 
	INTO v_estado_compra, v_es_paquete_compra 
	FROM Compra WHERE co_cod = v_compra_cod;

	-- Validar que es compra de itinerario (no paquete)
    IF v_es_paquete_compra IS TRUE THEN
        RAISE NOTICE 'Los paquetes se pagan solo con MILLA.';
        RETURN NULL::BOOLEAN;
    END IF;
	
	-- Validar si se esta pagando
	IF v_estado_compra = 'EN PROCESO' THEN
		RAISE NOTICE 'La compra sigue EN PROCESO. No se puede pagar';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Revisar si se financia
	v_es_financiada := FALSE;
	IF EXISTS (SELECT 1 FROM Cuota WHERE compra_co_cod = v_compra_cod) THEN
		v_es_financiada := TRUE;
	END IF;

	IF NOT EXISTS (SELECT 1 FROM Banco WHERE ba_cod = p_cheq_banco_cod) THEN
		RAISE NOTICE 'El codigo del banco no existe';
		RETURN NULL::BOOLEAN;
	END IF;
	
	INSERT INTO Metodo_Pago (cliente_c_cod, c_codigo_cuenta, c_numero, c_fecha_emision, c_nombre_titular, c_banco_cod, mp_tipo)
	VALUES (v_cliente_cod, p_cheq_cod_cuenta, p_cheq_numero, p_cheq_fecha_emision, p_cheq_nombre_titular, p_cheq_banco_cod, 'CHEQUE')
	RETURNING mp_cod INTO v_mp_cod;
	RAISE NOTICE 'Metodo de pago creado';

	INSERT INTO Pago VALUES (p_monto, CURRENT_TIMESTAMP, v_compra_cod, v_mp_cod);
	RAISE NOTICE 'Pago creado';

	-- Validar si ya completa la compra
	CALL sp_validar_pagos(v_compra_cod, v_es_financiada);
	
	RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_pago_deposito(
	p_cod_usuario INT,
	p_monto NUMERIC(12,2),
	p_dep_num_ref BIGINT,
	p_dep_num_destino BIGINT,
	p_dep_banco_cod INT
) RETURNS BOOLEAN AS $$
DECLARE
	v_compra_cod INT;
	v_cliente_cod INT;
	v_estado_compra VARCHAR;
	v_es_paquete_compra BOOLEAN;
	v_es_financiada BOOLEAN;
	v_mp_cod INT;
BEGIN
	-- Validar monto
	IF p_monto IS NULL OR p_monto <= 0 THEN
		RAISE NOTICE 'El monto debe ser positivo';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Existe cliente
	SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Validar que la compra existe
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'No hay ninguna compra EN PROCESO o PAGANDO';
		RETURN NULL::BOOLEAN;
	END IF;

	SELECT co_estado, co_es_paquete 
	INTO v_estado_compra, v_es_paquete_compra 
	FROM Compra WHERE co_cod = v_compra_cod;

	-- Validar que es compra de itinerario (no paquete)
    IF v_es_paquete_compra IS TRUE THEN
        RAISE NOTICE 'Los paquetes se pagan solo con MILLA.';
        RETURN NULL::BOOLEAN;
    END IF;
	
	-- Validar si se esta pagando
	IF v_estado_compra = 'EN PROCESO' THEN
		RAISE NOTICE 'La compra sigue EN PROCESO. No se puede pagar';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Revisar si se financia
	v_es_financiada := FALSE;
	IF EXISTS (SELECT 1 FROM Cuota WHERE compra_co_cod = v_compra_cod) THEN
		v_es_financiada := TRUE;
	END IF;

	IF NOT EXISTS (SELECT 1 FROM Banco WHERE ba_cod = p_dep_banco_cod) THEN
		RAISE NOTICE 'El codigo del banco no existe';
		RETURN NULL::BOOLEAN;
	END IF;
	
	INSERT INTO Metodo_Pago (cliente_c_cod, de_num_referencia, de_num_destino, de_banco_cod, mp_tipo)
	VALUES (v_cliente_cod, p_dep_num_ref, p_dep_num_destino, p_dep_banco_cod, 'DEPOSITO')
	RETURNING mp_cod INTO v_mp_cod;
	RAISE NOTICE 'Metodo de pago creado';

	INSERT INTO Pago VALUES (p_monto, CURRENT_TIMESTAMP, v_compra_cod, v_mp_cod);
	RAISE NOTICE 'Pago creado';

	-- Validar si ya completa la compra
	CALL sp_validar_pagos(v_compra_cod, v_es_financiada);
	
	RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_pago_operacion_digital(
	p_cod_usuario INT,
	p_monto NUMERIC(12,2),
	p_op_num_referencia BIGINT
) RETURNS BOOLEAN AS $$
DECLARE
	v_compra_cod INT;
	v_cliente_cod INT;
	v_estado_compra VARCHAR;
	v_es_paquete_compra BOOLEAN;
	v_es_financiada BOOLEAN;
	v_mp_cod INT;
BEGIN
	-- Validar monto
	IF p_monto IS NULL OR p_monto <= 0 THEN
		RAISE NOTICE 'El monto debe ser positivo';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Existe cliente
	SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Validar que la compra existe
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'No hay ninguna compra EN PROCESO o PAGANDO';
		RETURN NULL::BOOLEAN;
	END IF;

	SELECT co_estado, co_es_paquete 
	INTO v_estado_compra, v_es_paquete_compra 
	FROM Compra WHERE co_cod = v_compra_cod;

	-- Validar que es compra de itinerario (no paquete)
    IF v_es_paquete_compra IS TRUE THEN
        RAISE NOTICE 'Los paquetes se pagan solo con MILLA.';
        RETURN NULL::BOOLEAN;
    END IF;
	
	-- Validar si se esta pagando
	IF v_estado_compra = 'EN PROCESO' THEN
		RAISE NOTICE 'La compra sigue EN PROCESO. No se puede pagar';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Revisar si se financia
	v_es_financiada := FALSE;
	IF EXISTS (SELECT 1 FROM Cuota WHERE compra_co_cod = v_compra_cod) THEN
		v_es_financiada := TRUE;
	END IF;
	
	INSERT INTO Metodo_Pago (cliente_c_cod, od_num_referencia, mp_tipo)
	VALUES (v_cliente_cod, p_op_num_referencia, 'OPERACION_DIGITAL')
	RETURNING mp_cod INTO v_mp_cod;
	RAISE NOTICE 'Metodo de pago creado';

	INSERT INTO Pago VALUES (p_monto, CURRENT_TIMESTAMP, v_compra_cod, v_mp_cod);
	RAISE NOTICE 'Pago creado';

	-- Validar si ya completa la compra
	CALL sp_validar_pagos(v_compra_cod, v_es_financiada);
	
	RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fn_pago_cripto(
	p_cod_usuario INT,
	p_monto NUMERIC(12,2),
	p_cript_hash_id VARCHAR(100),
	p_cript_dir_billetera VARCHAR(100)
) RETURNS BOOLEAN AS $$
DECLARE
	v_compra_cod INT;
	v_cliente_cod INT;
	v_estado_compra VARCHAR;
	v_es_paquete_compra BOOLEAN;
	v_es_financiada BOOLEAN;
	v_mp_cod INT;
BEGIN
	-- Validar monto
	IF p_monto IS NULL OR p_monto <= 0 THEN
		RAISE NOTICE 'El monto debe ser positivo';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Existe cliente
	SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Validar que la compra existe
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'No hay ninguna compra EN PROCESO o PAGANDO';
		RETURN NULL::BOOLEAN;
	END IF;

	SELECT co_estado, co_es_paquete 
	INTO v_estado_compra, v_es_paquete_compra 
	FROM Compra WHERE co_cod = v_compra_cod;

	-- Validar que es compra de itinerario (no paquete)
    IF v_es_paquete_compra IS TRUE THEN
        RAISE NOTICE 'Los paquetes se pagan solo con MILLA.';
        RETURN NULL::BOOLEAN;
    END IF;
	
	-- Validar si se esta pagando
	IF v_estado_compra = 'EN PROCESO' THEN
		RAISE NOTICE 'La compra sigue EN PROCESO. No se puede pagar';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Revisar si se financia
	v_es_financiada := FALSE;
	IF EXISTS (SELECT 1 FROM Cuota WHERE compra_co_cod = v_compra_cod) THEN
		v_es_financiada := TRUE;
	END IF;
	
	INSERT INTO Metodo_Pago (cliente_c_cod, u_hash_id, u_direccion_billetera, mp_tipo)
	VALUES (v_cliente_cod, p_cript_hash_id, p_cript_dir_billetera, 'USDT')
	RETURNING mp_cod INTO v_mp_cod;
	RAISE NOTICE 'Metodo de pago creado';

	INSERT INTO Pago VALUES (p_monto, CURRENT_TIMESTAMP, v_compra_cod, v_mp_cod);
	RAISE NOTICE 'Pago creado';

	-- Validar si ya completa la compra
	CALL sp_validar_pagos(v_compra_cod, v_es_financiada);
	
	RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

-- Pagar con Millas
CREATE OR REPLACE FUNCTION fn_pago_millas(
	p_cod_usuario INT,
	p_monto INT
) RETURNS BOOLEAN AS $$
DECLARE
	v_compra_cod INT;
	v_cliente_cod INT;
	v_estado_compra VARCHAR;
	v_es_paquete_compra BOOLEAN;
	v_es_financiada BOOLEAN;
	v_mp_cod INT;
	v_tasa_milla NUMERIC;
	v_monto_calculado NUMERIC;
BEGIN
	-- Validar monto
	IF p_monto IS NULL OR p_monto <= 0 THEN
		RAISE NOTICE 'El monto debe ser positivo';
		RETURN NULL::BOOLEAN;
	END IF;
	
	-- Existe cliente
	SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Validar que la compra existe
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'No hay ninguna compra EN PROCESO o PAGANDO';
		RETURN NULL::BOOLEAN;
	END IF;

	SELECT co_estado, co_es_paquete 
	INTO v_estado_compra, v_es_paquete_compra 
	FROM Compra WHERE co_cod = v_compra_cod;

	-- Validar que es compra de itinerario (no paquete)
    IF v_es_paquete_compra IS TRUE THEN
        RAISE NOTICE 'Los paquetes se pagan con millas. Pero no con esta funcion.';
        RETURN NULL::BOOLEAN;
    END IF;
	
	-- Validar si se esta pagando
	IF v_estado_compra = 'EN PROCESO' THEN
		RAISE NOTICE 'La compra sigue EN PROCESO. No se puede pagar';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Revisar si se financia
	v_es_financiada := FALSE;
	IF EXISTS (SELECT 1 FROM Cuota WHERE compra_co_cod = v_compra_cod) THEN
		v_es_financiada := TRUE;
	END IF;	

	-- Calcular el monto equivalent de las Millas a Bs
	SELECT mp_cod INTO v_mp_cod FROM Metodo_Pago WHERE m_cliente_cod = v_cliente_cod;
	
	SELECT tca_valor_tasa INTO v_tasa_milla FROM Tasa_Cambio
	WHERE tca_fecha_hora_fin IS NULL AND tca_divisa_origen = 'Milla';

	IF v_tasa_milla IS NULL THEN
		RAISE NOTICE 'No se encontro la tasa de la Milla';
		RETURN NULL::BOOLEAN;
	END IF;

	v_monto_calculado := ROUND(p_monto/v_tasa_milla, 2);

	INSERT INTO Pago VALUES (v_monto_calculado, CURRENT_TIMESTAMP, v_compra_cod, v_mp_cod);
	RAISE NOTICE 'Pago creado';

	-- Validar si ya completa la compra
	CALL sp_validar_pagos(v_compra_cod, v_es_financiada);

	-- Una vez comprobado si se pago o no completo, eliminar el pago y volverlo a insertar con el monto de la milla
	DELETE FROM Pago WHERE compra_co_cod = v_compra_cod AND metodo_pago_mp_cod = v_mp_cod;

	INSERT INTO Pago VALUES (p_monto, CURRENT_TIMESTAMP, v_compra_cod, v_mp_cod);
	RAISE NOTICE 'Pago re-insertado (valor milla)';

	-- Descontar las millas
	UPDATE Metodo_Pago SET m_cant_acumulada = m_cant_acumulada - p_monto 
	WHERE mp_cod = v_mp_cod;
	
	RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

-- (PRIVADA) Crear cuotas de financiamiento
CREATE OR REPLACE PROCEDURE sp_crear_cuotas_pago(
    p_id_compra INT,
    p_monto_saldo NUMERIC(12,2),
    p_cant_cuotas INT
) AS $$
DECLARE
    v_monto_por_cuota NUMERIC(12,2);
    v_fecha_base TIMESTAMP;
    i INT;
BEGIN
    v_monto_por_cuota := p_monto_saldo / p_cant_cuotas;
    v_fecha_base := NOW();

    FOR i IN 1..p_cant_cuotas LOOP
        INSERT INTO Cuota (cu_monto, cu_fecha_hora_final, Compra_co_cod)
        VALUES (
            v_monto_por_cuota,
            v_fecha_base + (i || ' months')::INTERVAL,
            p_id_compra
        );
    END LOOP;

	RAISE NOTICE 'Se crearon % cuotas de %', p_cant_cuotas, v_monto_por_cuota;
END;
$$ LANGUAGE plpgsql;

-- (PRIVADA) Funcion para pagar el paquete con millas
CREATE OR REPLACE FUNCTION fn_pagar_paquete(p_cod_cliente INT, p_compra_cod INT)
RETURNS BOOLEAN AS $$
DECLARE
	v_millas_disponibles BIGINT;
	v_millas_a_descontar INT;
	v_cod_milla INT;
BEGIN
	SELECT mp_cod, m_cant_acumulada INTO v_cod_milla, v_millas_disponibles 
	FROM Metodo_Pago 
	WHERE m_cliente_cod = p_cod_cliente;

	SELECT pt_costo_millas INTO v_millas_a_descontar
	FROM Paquete_Turistico 
	WHERE pt_cod = (SELECT paquete_turistico_pt_cod FROM Compra WHERE co_cod = p_compra_cod);

	IF v_millas_disponibles < v_millas_a_descontar THEN
		RAISE NOTICE 'No hay suficiente cantidad de millas';
		RETURN FALSE;
	END IF;

	INSERT INTO Pago VALUES (v_millas_a_descontar, CURRENT_TIMESTAMP, p_compra_cod, v_cod_milla);
	RAISE NOTICE 'Pago con millas efectuado';
	
	UPDATE Metodo_Pago SET m_cant_acumulada = m_cant_acumulada - v_millas_a_descontar 
	WHERE m_cliente_cod = p_cod_cliente;

	UPDATE Compra SET co_estado = 'FINALIZADO' WHERE co_cod = p_compra_cod;
	
	RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

-- Procesar la compra a PAGANDO
CREATE OR REPLACE FUNCTION fn_procesar_a_pago(
    p_cod_usuario INT,
    p_es_financiado BOOLEAN DEFAULT FALSE,
    p_cant_cuotas INT DEFAULT 1,
	p_monto_huella NUMERIC DEFAULT NULL::NUMERIC
) RETURNS BOOLEAN AS $$
DECLARE
    v_cliente_cod INT;
	v_compra_cod INT;
	v_estado_compra VARCHAR;
	v_es_paquete_compra BOOLEAN;
    v_monto_total NUMERIC(15,2);
	v_monto_restante NUMERIC(12,2);
	v_resultado_compra_paquete BOOLEAN;
BEGIN
    -- Existe cliente
	SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;

	-- Validar que la compra existe
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'No hay ninguna compra EN PROCESO o PAGANDO';
		RETURN NULL::BOOLEAN;
	END IF;

	SELECT co_estado, co_es_paquete, co_monto_total
	INTO v_estado_compra, v_es_paquete_compra, v_monto_total
	FROM Compra WHERE co_cod = v_compra_cod;
	
	-- Validar si ya esta pagando
	IF v_estado_compra = 'PAGANDO' THEN
		RAISE NOTICE 'La compra ya se proceso a pagando. Complete los pagos';
		RETURN NULL::BOOLEAN;
	END IF;
    
	-- Validar si se quiere financiar, que no sea de paquete
    IF v_es_paquete_compra IS TRUE AND p_es_financiado IS TRUE THEN
        RAISE NOTICE 'No se pueden financiar compras de paquetes';
        RETURN NULL::BOOLEAN;
    END IF;

	-- Validar si se quiere financiar, cantidad de cuotas entre 1 y 3
    IF p_es_financiado IS TRUE AND p_cant_cuotas NOT BETWEEN 1 AND 3 THEN
        RAISE NOTICE 'La cantidad de cuotas debe estar entre 1 y 3';
        RETURN NULL::BOOLEAN;
    END IF;

    IF v_es_paquete_compra IS TRUE THEN
		SELECT * INTO v_resultado_compra_paquete FROM fn_pagar_paquete(v_cliente_cod, v_compra_cod); 
		RAISE NOTICE 'Intento de compra de paquete';
		RETURN v_resultado_compra_paquete;
	END IF;

	IF p_es_financiado IS TRUE THEN
		v_monto_restante := v_monto_total * 0.90;
		CALL sp_crear_cuotas_pago(v_compra_cod, v_monto_restante, p_cant_cuotas);
	END IF;

	UPDATE Compra SET co_estado = 'PAGANDO', co_compensacion_huella = p_monto_huella WHERE co_cod = v_compra_cod;

	RAISE NOTICE 'Compra cambió a PAGANDO exitosamente';
	RETURN TRUE;
	
EXCEPTION WHEN OTHERS THEN
    RAISE NOTICE 'Error procesando la compra a pagando: %', SQLERRM;
	RETURN NULL::BOOLEAN;
END;
$$ LANGUAGE plpgsql;

-- (PRIVADA) FUNCIÓN AUXILIAR: Agregar servicios del paquete a la compra
CREATE OR REPLACE PROCEDURE sp_agregar_servicios_paquete_a_compra(
    p_id_compra INT,
    p_id_paquete INT
) AS $$
DECLARE
	v_cant_personas INT;
	v_factor_tasa NUMERIC;
	v_tasa_cambio_cod INT;
	v_servicio RECORD;
    v_tipo_servicio VARCHAR(50);
    v_costo NUMERIC(12,2);
BEGIN
    SELECT pt_cant_personas INTO v_cant_personas FROM Paquete_Turistico WHERE pt_cod = p_id_paquete;
	-- Iterar sobre todos los servicios del paquete
    FOR v_servicio IN 
        SELECT ps.Servicio_s_cod 
        FROM Paq_Ser ps
        WHERE ps.Paquete_Turistico_pt_cod = p_id_paquete
    LOOP
        -- Determinar tipo de servicio y agregar a tabla correspondiente
        SELECT * INTO v_tipo_servicio FROM fn_obtener_tipo_proveedor_servicio(v_servicio.servicio_s_cod);

        -- Obtener costo del servicio
        SELECT s_costo INTO v_costo FROM Servicio WHERE s_cod = v_servicio.Servicio_s_cod;

		-- Aplicar la tasa de cambio
		SELECT cod_tasa, factor_tasa INTO v_tasa_cambio_cod, v_factor_tasa
		FROM fn_obtener_tasa_actual('USD');
	
		v_costo := v_costo * COALESCE(v_factor_tasa, 1);
		
        -- Insertar en tabla de detalle según tipo
        CASE v_tipo_servicio
            WHEN 'Aerolinea' THEN
                INSERT INTO Boleto_Vuelo (Compra_co_cod, Vuelo_s_cod, res_costo_sub_total, res_anulado, bv_cant_pasajeros, Clase_Asiento_ca_cod, tasa_cambio_tca_cod)
                VALUES (p_id_compra, v_servicio.Servicio_s_cod, v_costo, FALSE, v_cant_personas, 
				(WITH nave AS (SELECT mt_cod FROM Aeronave, Vuelo WHERE mt_cod = Aeronave_mt_cod AND s_cod = v_servicio.servicio_s_cod)
				SELECT ca.ca_cod FROM Clase_Asiento ca, nave n, Aer_Cla ac WHERE ac.aeronave_mt_cod = n.mt_cod AND ac.clase_asiento_ca_cod = ca.ca_cod LIMIT 1), 
				v_tasa_cambio_cod); -- Valores por defecto

            WHEN 'Crucero' THEN
                INSERT INTO Boleto_Viaje (Compra_co_cod, Viaje_s_cod, res_costo_sub_total, res_anulado, bvi_cant_pasajeros, Tipo_Camarote_tc_cod, tasa_cambio_tca_cod)
                VALUES (p_id_compra, v_servicio.Servicio_s_cod, v_costo, FALSE, v_cant_personas, 
				(WITH nave AS (SELECT mt_cod FROM Barco, Viaje WHERE mt_cod = barco_mt_cod AND s_cod = 21)
				SELECT tc.tc_cod FROM Tipo_Camarote tc, nave n, Bar_Tip bt WHERE bt.barco_mt_cod = n.mt_cod AND bt.tipo_camarote_tc_cod = tc.tc_cod LIMIT 1), 
				v_tasa_cambio_cod);

            WHEN 'Hotel' THEN
                INSERT INTO Detalle_Hospedaje (Compra_co_cod, Habitacion_s_cod, res_costo_sub_total, res_anulado, dh_cant_noches, dh_fecha_hora_check_in, dh_fecha_hora_check_out, tasa_cambio_tca_cod)
                VALUES (p_id_compra, v_servicio.Servicio_s_cod, v_costo, FALSE, 1, NOW(), NOW() + INTERVAL '1 day', v_tasa_cambio_cod);

            WHEN 'Transporte' THEN
                INSERT INTO Detalle_Traslado (Compra_co_cod, Traslado_s_cod, res_costo_sub_total, res_anulado, dt_fecha_hora, Automovil_mt_cod, tasa_cambio_tca_cod)
                VALUES (p_id_compra, v_servicio.Servicio_s_cod, v_costo, FALSE, NOW(), 
				(WITH transporte AS (SELECT transporte_terrestre_p_cod FROM traslado WHERE s_cod = v_servicio.servicio_s_cod)
				SELECT mt_cod FROM automovil a, transporte t WHERE a.transporte_terrestre_p_cod = t.transporte_terrestre_p_cod LIMIT 1), 
				v_tasa_cambio_cod);

            WHEN 'Operador' THEN
                INSERT INTO Entrada_Digital (Compra_co_cod, Servicio_Adicional_s_cod, res_costo_sub_total, res_anulado, ed_cant_personas, tasa_cambio_tca_cod)
                VALUES (p_id_compra, v_servicio.Servicio_s_cod, v_costo, FALSE, v_cant_personas, v_tasa_cambio_cod);
        END CASE;

		UPDATE Compra SET co_monto_total = co_monto_total + v_costo WHERE co_cod = p_id_compra;

    END LOOP;
	RAISE NOTICE 'Reservas del paquete % agregadas a la compra %', p_id_paquete, p_id_compra;
END;
$$ LANGUAGE plpgsql;

-- Crear compra tipo PAQUETE
CREATE OR REPLACE FUNCTION fn_crear_compra_paquete(
    p_cod_usuario INT,
    p_id_paquete INT
) RETURNS BOOLEAN AS $$
DECLARE
    v_cliente_cod INT;
	v_compra_cod INT;
	v_costo_paquete NUMERIC(12,2);
    v_costo_millas INT;
    v_cant_personas INT;
BEGIN
    -- Existe cliente
	SELECT c.c_cod INTO v_cliente_cod FROM Cliente c, Usuario u WHERE c.c_cod = u.cliente_c_cod AND u.u_cod = p_cod_usuario;
	IF v_cliente_cod IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN NULL::BOOLEAN;
	END IF;

    -- Validar que el paquete existe
    IF NOT EXISTS (SELECT 1 FROM Paquete_Turistico WHERE pt_cod = p_id_paquete) THEN
		RAISE NOTICE 'El paquete turistico no existe';
        RETURN NULL::BOOLEAN;
    END IF;

	-- Validar que la compra existe, si no, crearlo
    SELECT * INTO v_compra_cod FROM fn_obtener_compra_activa(v_cliente_cod);
	IF v_compra_cod IS NOT NULL THEN
		RAISE NOTICE 'Ya hay otra compra en proceso. Completarla o cancelarla para comprar paquete';
		RETURN NULL::BOOLEAN;
	END IF;

    -- Obtener datos del paquete
    SELECT pt_costo, pt_costo_millas, pt_cant_personas 
	INTO v_costo_paquete, v_costo_millas, v_cant_personas
    FROM Paquete_Turistico WHERE pt_cod = p_id_paquete;

    -- Crear la compra de paquete
    INSERT INTO Compra (co_fecha_hora, co_monto_total, co_millas_a_agregar, co_estado, co_es_paquete, Cliente_c_cod, paquete_Turistico_pt_cod)
    VALUES (NOW(), v_costo_paquete, 0, 'EN PROCESO', TRUE, v_cliente_cod, p_id_paquete)
    RETURNING co_cod INTO v_compra_cod;

    -- Obtener servicios del paquete e insertarlos en las tablas de detalle
    -- Se insertarán con valores por defecto
    CALL sp_agregar_servicios_paquete_a_compra(v_compra_cod, p_id_paquete);

    RAISE NOTICE 'Compra de paquete creado exitosamente';
	RETURN TRUE;
	
EXCEPTION WHEN OTHERS THEN
	RAISE NOTICE 'Error creando la compra de paquete: %', SQLERRM;
	RETURN NULL::BOOLEAN;
END;
$$ LANGUAGE plpgsql;

-- FUNCIÓN PARA AGREGAR VIAJEROS
CREATE OR REPLACE FUNCTION fn_agregar_viajero(
	p_cod_usuario INT,
	p_cod_servicio_reserva INT,
	p_via_nombre VARCHAR,
	p_via_s_nombre VARCHAR,
	p_via_apellido VARCHAR,
	p_via_s_apellido VARCHAR,
	p_via_correo VARCHAR,
	p_via_fnacim DATE
) RETURNS BOOLEAN AS $$
DECLARE
    v_cliente_cod INT;
	v_compra_cod INT;
	v_estado_compra VARCHAR;
	v_viajero_cod INT;
	v_tipo_reserva VARCHAR; -- 'VUELO', 'HOTEL', 'TRASLADO', 'CRUCERO', 'ENTRADA'
	v_capacidad_max INT := 0;
	v_cantidad_actual INT := 0;
BEGIN
    -- Obtener Cliente desde Usuario (Asumiendo que c_ci es la PK según archivos anteriores)
	SELECT c.c_cod INTO v_cliente_cod FROM Cliente c JOIN Usuario u ON c.c_cod = u.cliente_c_cod WHERE u.u_cod = p_cod_usuario;

	IF v_cliente_ci IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado para el usuario %', p_cod_usuario;
		RETURN FALSE;
	END IF;

	-- Validar que la compra existe
    SELECT fn_obtener_compra_activa(v_cliente_ci) INTO v_compra_cod;
	
	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'No hay ninguna compra EN PROCESO para agregar Viajeros';
		RETURN FALSE;
	END IF;

	SELECT co_estado INTO v_estado_compra FROM Compra WHERE co_cod = v_compra_cod;
	
	-- Validar estado
	IF v_estado_compra <> 'EN PROCESO' THEN
		RAISE NOTICE 'No se pueden agragar viajeros a esta compra. No está EN PROCESO';
		RETURN FALSE;
	END IF;

	-- TIPO DE SERVICIO Y VALIDAR CAPACIDAD
	v_tipo_reserva := NULL;

	-- Revisar si es VUELO
	IF EXISTS (SELECT 1 FROM Boleto_Vuelo WHERE compra_co_cod = v_compra_cod AND vuelo_s_cod = p_cod_servicio_reserva) THEN
		v_tipo_reserva := 'VUELO';
		-- Capacidad: Cantidad de pasajeros indicada en la reserva
		SELECT bv_cantidad_pasajeros INTO v_capacidad_max 
		FROM Boleto_Vuelo WHERE compra_co_cod = v_compra_cod AND vuelo_s_cod = p_cod_servicio_reserva;
		
		-- Contar actuales
		SELECT COUNT(*) INTO v_cantidad_actual FROM Via_Res 
		WHERE boleto_vuelo_co_cod = v_compra_cod AND boleto_vuelo_s_cod = p_cod_servicio_reserva;

	-- Revisar si es HOSPEDAJE (Hotel)
	ELSIF EXISTS (SELECT 1 FROM Detalle_Hospedaje WHERE compra_co_cod = v_compra_cod AND habitacion_s_cod = p_cod_servicio_reserva) THEN
		v_tipo_reserva := 'HOTEL';
		-- Capacidad: Capacidad real de la habitación (ha_capacidad)
		SELECT h.ha_capacidad INTO v_capacidad_max
		FROM Detalle_Hospedaje dh
		JOIN Habitacion h ON dh.habitacion_s_cod = h.s_cod
		WHERE dh.compra_co_cod = v_compra_cod AND dh.habitacion_s_cod = p_cod_servicio_reserva;

		SELECT COUNT(*) INTO v_cantidad_actual FROM Via_Res 
		WHERE detalle_hospedaje_co_cod = v_compra_cod AND detalle_hospedaje_s_cod = p_cod_servicio_reserva;

	-- Revisar si es TRASLADO
	ELSIF EXISTS (SELECT 1 FROM Detalle_Traslado WHERE compra_co_cod = v_compra_cod AND traslado_s_cod = p_cod_servicio_reserva) THEN
		v_tipo_reserva := 'TRASLADO';
		-- Capacidad: Capacidad del vehículo asignado (Automovil.mt_capacidad)
		SELECT a.mt_capacidad INTO v_capacidad_max
		FROM Detalle_Traslado dt
		JOIN Automovil a ON dt.automovil_mt_cod = a.mt_cod
		WHERE dt.compra_co_cod = v_compra_cod AND dt.traslado_s_cod = p_cod_servicio_reserva;

		SELECT COUNT(*) INTO v_cantidad_actual FROM Via_Res 
		WHERE detalle_traslado_co_cod = v_compra_cod AND detalle_traslado_s_cod = p_cod_servicio_reserva;

	-- Revisar si es CRUCERO
	ELSIF EXISTS (SELECT 1 FROM Boleto_Viaje WHERE compra_co_cod = v_compra_cod AND viaje_s_cod = p_cod_servicio_reserva) THEN
		v_tipo_reserva := 'CRUCERO';
		SELECT bvi_cant_pasajeros INTO v_capacidad_max
		FROM Boleto_Viaje WHERE compra_co_cod = v_compra_cod AND viaje_s_cod = p_cod_servicio_reserva;

		SELECT COUNT(*) INTO v_cantidad_actual FROM Via_Res 
		WHERE boleto_viaje_co_cod = v_compra_cod AND boleto_viaje_s_cod = p_cod_servicio_reserva;

	-- Revisar si es ENTRADA DIGITAL
	ELSIF EXISTS (SELECT 1 FROM Entrada_Digital WHERE compra_co_cod = v_compra_cod AND servicio_adicional_s_cod = p_cod_servicio_reserva) THEN
		v_tipo_reserva := 'ENTRADA';
		SELECT ed_cant_personas INTO v_capacidad_max
		FROM Entrada_Digital WHERE compra_co_cod = v_compra_cod AND servicio_adicional_s_cod = p_cod_servicio_reserva;

		SELECT COUNT(*) INTO v_cantidad_actual FROM Via_Res 
		WHERE entrada_digital_co_cod = v_compra_cod AND entrada_digital_s_cod = p_cod_servicio_reserva;
	
	ELSE
		RAISE NOTICE 'El servicio indicado (%) no pertenece a la compra activa del cliente.', p_cod_servicio_reserva;
		RETURN FALSE;
	END IF;

	-- VERIFICAR LÍMITE ALCANZADO
	IF v_cantidad_actual >= v_capacidad_max THEN
		RAISE EXCEPTION 'No se puede agregar viajero. Capacidad máxima alcanzada para este servicio (% / %)', v_cantidad_actual, v_capacidad_max;
		RETURN FALSE;
	END IF;

	-- INSERTAR VIAJERO (O usar existente si ya está en la BD)
	-- Buscamos si existe por correo, sino crea
	SELECT via_cod INTO v_viajero_cod FROM Viajero WHERE via_correo = p_via_correo LIMIT 1;
	
	IF v_viajero_cod IS NULL THEN
		INSERT INTO Viajero (via_p_nombre, via_s_nombre, via_p_apellido, via_s_apellido, via_correo, via_fecha_nacimiento)
		VALUES (p_via_nombre, p_via_s_nombre, p_via_apellido, p_via_s_apellido, p_via_correo, p_via_fnacim)
		RETURNING via_cod INTO v_viajero_cod;
	END IF;

	-- VINCULAR VIAJERO A LA RESERVA
	CASE v_tipo_reserva
		WHEN 'VUELO' THEN
			INSERT INTO Via_Res (viajero_via_cod, boleto_vuelo_co_cod, boleto_vuelo_s_cod)
			VALUES (v_viajero_cod, v_compra_cod, p_cod_servicio_reserva);
		WHEN 'HOTEL' THEN
			INSERT INTO Via_Res (viajero_via_cod, detalle_hospedaje_co_cod, detalle_hospedaje_s_cod)
			VALUES (v_viajero_cod, v_compra_cod, p_cod_servicio_reserva);
		WHEN 'TRASLADO' THEN
			INSERT INTO Via_Res (viajero_via_cod, detalle_traslado_co_cod, detalle_traslado_s_cod)
			VALUES (v_viajero_cod, v_compra_cod, p_cod_servicio_reserva);
		WHEN 'CRUCERO' THEN
			INSERT INTO Via_Res (viajero_via_cod, boleto_viaje_co_cod, boleto_viaje_s_cod)
			VALUES (v_viajero_cod, v_compra_cod, p_cod_servicio_reserva);
		WHEN 'ENTRADA' THEN
			INSERT INTO Via_Res (viajero_via_cod, entrada_digital_co_cod, entrada_digital_s_cod)
			VALUES (v_viajero_cod, v_compra_cod, p_cod_servicio_reserva);
	END CASE;

	RAISE NOTICE 'Viajero agregado exitosamente. (%/%)', v_cantidad_actual + 1, v_capacidad_max;
	RETURN TRUE;

EXCEPTION WHEN OTHERS THEN
	RAISE NOTICE 'Error al agregar viajero: %', SQLERRM;
	RETURN FALSE;
END;
$$ LANGUAGE plpgsql;


-- FUNCIÓN PARA ELIMINAR (QUITAR) VIAJEROS
CREATE OR REPLACE FUNCTION fn_eliminar_viajero(
	p_cod_usuario INT,
	p_cod_servicio_reserva INT,
	p_via_correo VARCHAR
) RETURNS BOOLEAN AS $$
DECLARE
    v_cliente_cod INT;
	v_compra_cod INT;
	v_viajero_cod INT;
	v_borrado BOOLEAN := FALSE;
BEGIN
    -- Existe cliente
	SELECT c.c_cod INTO v_cliente_cod FROM Cliente c JOIN Usuario u ON c.c_cod = u.cliente_c_cod WHERE u.u_cod = p_cod_usuario;

	IF v_cliente_ci IS NULL THEN
		RAISE NOTICE 'El cliente no se ha encontrado';
		RETURN FALSE;
	END IF;

	-- Validar compra activa
    SELECT fn_obtener_compra_activa(v_cliente_cod) INTO v_compra_cod;
	IF v_compra_cod IS NULL THEN
		RAISE NOTICE 'No hay compra activa para eliminar viajeros.';
		RETURN FALSE;
	END IF;

	-- Identificar al viajero por correo
	SELECT via_cod INTO v_viajero_cod FROM Viajero WHERE via_correo = p_via_correo;
	
	IF v_viajero_cod IS NULL THEN
		RAISE NOTICE 'El viajero con correo % no existe.', p_via_correo;
		RETURN FALSE;
	END IF;

	-- ELIMINAR DE VIA_RES SEGÚN EL SERVICIO
	
	DELETE FROM Via_Res 
	WHERE viajero_via_cod = v_viajero_cod
	AND (
		(boleto_vuelo_co_cod = v_compra_cod AND boleto_vuelo_s_cod = p_cod_servicio_reserva) OR
		(detalle_hospedaje_co_cod = v_compra_cod AND detalle_hospedaje_s_cod = p_cod_servicio_reserva) OR
		(detalle_traslado_co_cod = v_compra_cod AND detalle_traslado_s_cod = p_cod_servicio_reserva) OR
		(boleto_viaje_co_cod = v_compra_cod AND boleto_viaje_s_cod = p_cod_servicio_reserva) OR
		(entrada_digital_co_cod = v_compra_cod AND entrada_digital_s_cod = p_cod_servicio_reserva)
	);

	GET DIAGNOSTICS v_borrado = ROW_COUNT;

	IF v_borrado THEN
		RAISE NOTICE 'Viajero eliminado exitosamente del servicio %.', p_cod_servicio_reserva;
		RETURN TRUE;
	ELSE
		RAISE NOTICE 'El viajero no estaba asociado a este servicio en esta compra.';
		RETURN FALSE;
	END IF;

EXCEPTION WHEN OTHERS THEN
	RAISE NOTICE 'Error al eliminar viajero: %', SQLERRM;
	RETURN FALSE;
END;
$$ LANGUAGE plpgsql;


-- ===================================================
-- FUNCIONES DE REPORTE
-- ===================================================

-- Reporte para calificacion promedio
CREATE OR REPLACE FUNCTION fn_reporte_ranking_proveedores()
RETURNS TABLE (
    tipo_proveedor VARCHAR,
    nombre_proveedor VARCHAR,
    calificacion_promedio NUMERIC(4, 2),
    cantidad_resenas INT,
    clasificacion_estrellas VARCHAR -- Visualización textual (ej: ★★★★★)
) AS $$
BEGIN
    RETURN QUERY
    WITH Resenas_Unificadas AS (
        -- AEROLÍNEAS (Desde Boleto_Vuelo)
        SELECT 
            'Aerolínea'::VARCHAR AS tipo,
            a.p_nombre AS nombre,
            r.r_calificacion AS puntaje
        FROM Resena r
        JOIN Boleto_Vuelo bv 
            ON r.Boleto_Vuelo_co_cod = bv.compra_co_cod 
            AND r.Boleto_Vuelo_s_cod = bv.vuelo_s_cod
        JOIN Vuelo v ON bv.vuelo_s_cod = v.s_cod
        JOIN Aerolinea a ON v.aerolinea_p_cod = a.p_cod

        UNION ALL

        -- CRUCEROS (Desde Boleto_Viaje)
        SELECT 
            'Compañía de Cruceros'::VARCHAR,
            c.p_nombre,
            r.r_calificacion
        FROM Resena r
        JOIN Boleto_Viaje bvi 
            ON r.Boleto_Viaje_co_cod = bvi.compra_co_cod 
            AND r.Boleto_Viaje_s_cod = bvi.viaje_s_cod
        JOIN Viaje vi ON bvi.viaje_s_cod = vi.s_cod
        JOIN Crucero c ON vi.crucero_p_cod = c.p_cod

        UNION ALL

        -- OPERADORES TURÍSTICOS (Desde Entrada_Digital - Servicios Adicionales)
        SELECT 
            'Operador Turístico'::VARCHAR,
            op.p_nombre,
            r.r_calificacion
        FROM Resena r
        JOIN Entrada_Digital ed 
            ON r.Entrada_Digital_co_cod = ed.compra_co_cod 
            AND r.Entrada_Digital_s_cod = ed.servicio_adicional_s_cod
        JOIN Servicio_Adicional sa ON ed.servicio_adicional_s_cod = sa.s_cod
        JOIN Operador_Turistico op ON sa.operador_turistico_p_cod = op.p_cod

		UNION ALL
		
        -- TRANSPORTE TERRESTRE (Desde Detalle_Traslado - Traslado)
		SELECT 
            'Transporte Terrestre'::VARCHAR,
            tt.p_nombre,
            r.r_calificacion
        FROM Resena r
        JOIN Detalle_Traslado dt 
            ON r.Detalle_Traslado_co_cod = dt.compra_co_cod 
            AND r.Detalle_Traslado_s_cod = dt.traslado_s_cod
        JOIN Traslado t ON dt.traslado_s_cod = t.s_cod
        JOIN Transporte_Terrestre tt ON t.transporte_terrestre_p_cod = tt.p_cod

		UNION ALL
		
		-- HOTEL (Desde Detalle_Hospedaje - Habitacion)
		SELECT 
            'Hotel'::VARCHAR,
            ho.p_nombre,
            r.r_calificacion
        FROM Resena r
        JOIN Detalle_Hospedaje dh 
            ON r.Detalle_Hospedaje_co_cod = dh.compra_co_cod 
            AND r.Detalle_Hospedaje_s_cod = dh.habitacion_s_cod
        JOIN Habitacion ha ON dh.habitacion_s_cod = ha.s_cod
        JOIN Hotel ho ON ha.hotel_p_cod = ho.p_cod
    )
    SELECT 
        ru.tipo,
        ru.nombre,
        ROUND(AVG(ru.puntaje), 2) AS promedio,
        COUNT(*)::INT AS total_resenas,
        REPEAT('★', (ROUND(AVG(ru.puntaje))/2)::INT)::VARCHAR AS estrellas
    FROM Resenas_Unificadas ru
    GROUP BY ru.tipo, ru.nombre
    ORDER BY promedio DESC, ru.nombre;
END;
$$ LANGUAGE plpgsql;

-- Impacto Financiero de Millas en Reservas Internacionales
CREATE OR REPLACE FUNCTION fn_reporte_impacto_financiero_millas()
RETURNS TABLE (
    id_compra INT,
    fecha_transaccion TIMESTAMP,
    millas_usadas NUMERIC(12,2),
    tasa_milla_bs NUMERIC(10, 4), -- Valor de 1 Milla en VES
    valor_total_bs NUMERIC(15, 2), -- Valor total en VES
    tasa_usd_historica NUMERIC(10, 4), -- Tasa USD en la fecha
    valor_cubierto_usd NUMERIC(15, 2), -- Equivalente en USD
    tasa_eur_historica NUMERIC(10, 4), -- Tasa EUR en la fecha
    valor_cubierto_eur NUMERIC(15, 2)  -- Equivalente en EUR
) AS $$
BEGIN
    RETURN QUERY
    WITH Pagos_Milla AS (
        -- Seleccionar pagos hechos con millas
        SELECT 
            p.compra_co_cod,
            p.pa_fecha_hora AS fecha_pago,
            p.pa_monto AS cantidad_millas -- Asumiendo que m_cant_acumulada guarda lo usado en la tx
        FROM Pago p
        JOIN Metodo_Pago mp ON p.metodo_pago_mp_cod = mp.mp_cod
        WHERE mp.mp_tipo = 'MILLA'
    ),
    Compras_Internacionales AS (
        -- Filtrar compras que tengan algún destino/lugar fuera de Venezuela
        SELECT DISTINCT c.co_cod
        FROM Compra c
        -- Verificar Vuelos (Origen)
        LEFT JOIN Boleto_Vuelo bv ON c.co_cod = bv.compra_co_cod
        LEFT JOIN Vuelo v ON bv.vuelo_s_cod = v.s_cod
        LEFT JOIN Lugar lug_v1 ON v.lugar_l_cod = lug_v1.l_cod
		LEFT JOIN Lugar lug_v2 ON lug_v1.lugar_l_cod = lug_v2.l_cod
		LEFT JOIN Lugar lug_v3 ON lug_v2.lugar_l_cod = lug_v3.l_cod
		LEFT JOIN Lugar lug_v4 ON lug_v3.lugar_l_cod = lug_v4.l_cod

		-- Verificar Traslados
		LEFT JOIN Detalle_Traslado dt ON c.co_cod = dt.compra_co_cod
		LEFT JOIN Traslado t ON t.s_cod = dt.traslado_s_cod
		LEFT JOIN Lugar lug_t1 ON lug_t1.l_cod = t.lugar_l_cod
		LEFT JOIN Lugar lug_t2 ON lug_t2.l_cod = lug_t1.lugar_l_cod
		LEFT JOIN Lugar lug_t3 ON lug_t3.l_cod = lug_t2.lugar_l_cod
		LEFT JOIN Lugar lug_t4 ON lug_t4.l_cod = lug_t3.lugar_l_cod
		
		-- Verificar Hoteles (Ubicación)
        LEFT JOIN Detalle_Hospedaje dh ON c.co_cod = dh.compra_co_cod
        LEFT JOIN Habitacion h ON dh.habitacion_s_cod = h.s_cod
        LEFT JOIN Hotel ho ON h.hotel_p_cod = ho.p_cod
		LEFT JOIN Lugar lug_h1 ON lug_h1.l_cod = ho.lugar_l_cod
		LEFT JOIN Lugar lug_h2 ON lug_h2.l_cod = lug_h1.lugar_l_cod
		LEFT JOIN Lugar lug_h3 ON lug_h3.l_cod = lug_h2.lugar_l_cod
		LEFT JOIN Lugar lug_h4 ON lug_h4.l_cod = lug_h3.lugar_l_cod
       
		-- Verificar Viajes (Origen)
		LEFT JOIN Boleto_Viaje bvi ON c.co_cod = bvi.compra_co_cod
		LEFT JOIN Viaje vi ON vi.s_cod = bvi.viaje_s_cod
		LEFT JOIN Lugar lug_vi1 ON lug_vi1.l_cod = vi.lugar_l_cod
		LEFT JOIN Lugar lug_vi2 ON lug_vi2.l_cod = lug_vi1.lugar_l_cod
		LEFT JOIN Lugar lug_vi3 ON lug_vi3.l_cod = lug_vi2.lugar_l_cod
		LEFT JOIN Lugar lug_vi4 ON lug_vi4.l_cod = lug_vi3.lugar_l_cod
		
		-- Verificar Servicios Adicionales
		LEFT JOIN Entrada_Digital ed ON c.co_cod = ed.compra_co_cod
		LEFT JOIN Servicio_Adicional sa ON sa.s_cod = ed.servicio_adicional_s_cod
		LEFT JOIN Lugar lug_sa1 ON lug_sa1.l_cod = sa.lugar_l_cod
		LEFT JOIN Lugar lug_sa2 ON lug_sa2.l_cod = lug_sa1.lugar_l_cod
		LEFT JOIN Lugar lug_sa3 ON lug_sa3.l_cod = lug_sa2.lugar_l_cod
		LEFT JOIN Lugar lug_sa4 ON lug_sa4.l_cod = lug_sa3.lugar_l_cod
        
        WHERE (
			(COALESCE(lug_v1.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_v2.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_v3.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_v4.l_nombre, '') <> 'Venezuela'))
			OR (
			(COALESCE(lug_t1.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_t2.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_t3.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_t4.l_nombre, '') <> 'Venezuela'))
			OR (
			(COALESCE(lug_h1.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_h2.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_h3.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_h4.l_nombre, '') <> 'Venezuela'))
			OR (
			(COALESCE(lug_vi1.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_vi2.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_vi3.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_vi4.l_nombre, '') <> 'Venezuela'))
			OR (
			(COALESCE(lug_sa1.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_sa2.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_sa3.l_nombre, '') <> 'Venezuela') AND
			(COALESCE(lug_sa4.l_nombre, '') <> 'Venezuela'))
    )
    SELECT 
        pm.compra_co_cod,
        pm.fecha_pago,
        pm.cantidad_millas,
        
        -- Obtener Tasa Histórica de la Milla (MILLA -> VES)
        COALESCE((
            SELECT tca_valor_tasa FROM Tasa_Cambio 
            WHERE tca_divisa_origen = 'MILLA' 
              AND pm.fecha_pago >= tca_fecha_hora_tasa 
              AND (tca_fecha_hora_fin IS NULL OR pm.fecha_pago < tca_fecha_hora_fin)
            ORDER BY tca_fecha_hora_tasa DESC LIMIT 1
        ), 0) AS tasa_milla,

        -- Calcular Valor en VES
        (pm.cantidad_millas * COALESCE((
            SELECT tca_valor_tasa FROM Tasa_Cambio 
            WHERE tca_divisa_origen = 'MILLA' 
              AND pm.fecha_pago >= tca_fecha_hora_tasa 
              AND (tca_fecha_hora_fin IS NULL OR pm.fecha_pago < tca_fecha_hora_fin)
            ORDER BY tca_fecha_hora_tasa DESC LIMIT 1
        ), 0)) AS valor_ves,

        -- Obtener Tasa Histórica USD (USD -> VES)
        COALESCE((
            SELECT tca_valor_tasa FROM Tasa_Cambio 
            WHERE tca_divisa_origen = 'USD' 
              AND pm.fecha_pago >= tca_fecha_hora_tasa 
              AND (tca_fecha_hora_fin IS NULL OR pm.fecha_pago < tca_fecha_hora_fin)
            ORDER BY tca_fecha_hora_tasa DESC LIMIT 1
        ), 1) AS tasa_usd, -- Evitar división por cero

        -- Calcular Valor Cubierto en USD (Valor VES / Tasa USD)
        ROUND(
            (pm.cantidad_millas * 
			COALESCE(
			(SELECT tca_valor_tasa 
			FROM Tasa_Cambio WHERE tca_divisa_origen = 'MILLA' 
			AND pm.fecha_pago >= tca_fecha_hora_tasa ORDER BY tca_fecha_hora_tasa DESC LIMIT 1), 0)) 
            / 
            NULLIF(COALESCE(
			(SELECT tca_valor_tasa 
			FROM Tasa_Cambio WHERE tca_divisa_origen = 'USD' 
			AND pm.fecha_pago >= tca_fecha_hora_tasa ORDER BY tca_fecha_hora_tasa DESC LIMIT 1), 1), 0)
        , 2) AS valor_usd,

        -- Obtener Tasa Histórica EUR (EUR -> VES)
        COALESCE((
            SELECT tca_valor_tasa FROM Tasa_Cambio 
            WHERE tca_divisa_origen = 'EUR' 
              AND pm.fecha_pago >= tca_fecha_hora_tasa 
              AND (tca_fecha_hora_fin IS NULL OR pm.fecha_pago < tca_fecha_hora_fin)
            ORDER BY tca_fecha_hora_tasa DESC LIMIT 1
        ), 1) AS tasa_eur,

        -- Calcular Valor Cubierto en EUR
        ROUND(
            (pm.cantidad_millas * 
			COALESCE(
			(SELECT tca_valor_tasa 
			FROM Tasa_Cambio WHERE tca_divisa_origen = 'MILLA' 
			AND pm.fecha_pago >= tca_fecha_hora_tasa ORDER BY tca_fecha_hora_tasa DESC LIMIT 1), 0)) 
            / 
            NULLIF(COALESCE(
			(SELECT tca_valor_tasa 
			FROM Tasa_Cambio WHERE tca_divisa_origen = 'EUR' 
			AND pm.fecha_pago >= tca_fecha_hora_tasa ORDER BY tca_fecha_hora_tasa DESC LIMIT 1), 1), 0)
        , 2) AS valor_eur

    FROM Pagos_Milla pm
    JOIN Compras_Internacionales ci ON pm.compra_co_cod = ci.co_cod;
END;
$$ LANGUAGE plpgsql;

-- Auditoria reembolsos y penalizaciones por cancelacion
CREATE OR REPLACE FUNCTION fn_auditoria_reembolsos()
RETURNS TABLE (
	razon_reembolso VARCHAR,
	monto_retenido_10 NUMERIC(15,2),
	monto_devuelto_90 NUMERIC(15,2),
	fecha_reembolso DATE,
	reserva_cancelada VARCHAR
) AS $$
BEGIN
	RETURN QUERY 
	SELECT r.ree_razon, ROUND(nc.nc_monto_devuelto / 9.0, 2), nc.nc_monto_devuelto, r.ree_fecha_hora::DATE,
        -- Identificar qué se canceló
        CASE 
            WHEN r.Boleto_Vuelo_co_cod IS NOT NULL THEN 
                'Vuelo: ' || COALESCE(v.v_cod_vue, 'N/A')::VARCHAR
            WHEN r.Detalle_Traslado_co_cod IS NOT NULL THEN 
                'Traslado hacia: ' || COALESCE(lug_t.l_nombre, 'Destino Desconocido')::VARCHAR
            WHEN r.Boleto_Viaje_co_cod IS NOT NULL THEN 
                'Crucero: ' || COALESCE(b.b_nombre, 'Barco Desconocido')::VARCHAR
            WHEN r.Entrada_Digital_co_cod IS NOT NULL THEN 
                'Actividad: ' || COALESCE(sa.sa_nombre, 'N/A')::VARCHAR
            WHEN r.Detalle_Hospedaje_co_cod IS NOT NULL THEN 
                'Hotel: ' || COALESCE(h.p_nombre, 'N/A') || ' - Hab: ' || COALESCE(hab.ha_numero, '?')::VARCHAR
            ELSE 'Servicio Desconocido'::VARCHAR
        END
    FROM Reembolso r
    JOIN Nota_Credito nc ON r.ree_cod = nc.reembolso_ree_cod
    
    -- Vuelos
    LEFT JOIN Boleto_Vuelo bv ON r.Boleto_Vuelo_co_cod = bv.compra_co_cod AND r.Boleto_Vuelo_s_cod = bv.vuelo_s_cod
    LEFT JOIN Vuelo v ON bv.vuelo_s_cod = v.s_cod
    
    -- Traslados
    LEFT JOIN Detalle_Traslado dt ON r.Detalle_Traslado_co_cod = dt.compra_co_cod AND r.Detalle_Traslado_s_cod = dt.traslado_s_cod
    LEFT JOIN Traslado t ON dt.traslado_s_cod = t.s_cod
    LEFT JOIN Lugar lug_t ON t.lugar_l_cod = lug_t.l_cod
    
    -- Viajes
    LEFT JOIN Boleto_Viaje bvi ON r.Boleto_Viaje_co_cod = bvi.compra_co_cod AND r.Boleto_Viaje_s_cod = bvi.viaje_s_cod
    LEFT JOIN Viaje vi ON bvi.viaje_s_cod = vi.s_cod
    LEFT JOIN Barco b ON vi.barco_mt_cod = b.mt_cod
    
    -- Entradas
    LEFT JOIN Entrada_Digital ed ON r.Entrada_Digital_co_cod = ed.compra_co_cod AND r.Entrada_Digital_s_cod = ed.servicio_adicional_s_cod
    LEFT JOIN Servicio_Adicional sa ON ed.servicio_adicional_s_cod = sa.s_cod
    
    -- Hoteles
    LEFT JOIN Detalle_Hospedaje dh ON r.Detalle_Hospedaje_co_cod = dh.compra_co_cod AND r.Detalle_Hospedaje_s_cod = dh.habitacion_s_cod
    LEFT JOIN Habitacion hab ON dh.habitacion_s_cod = hab.s_cod
    LEFT JOIN Hotel h ON hab.hotel_p_cod = h.p_cod
    
    WHERE r.ree_fecha_hora BETWEEN (CURRENT_TIMESTAMP - '3 months'::INTERVAL) AND CURRENT_TIMESTAMP;
END;
$$ LANGUAGE plpgsql;

-- Canje de paquetes por millas
CREATE OR REPLACE FUNCTION fn_paquetes_canjeados()
RETURNS TABLE (
	nombre_paquete VARCHAR,
	descripcion_paquete VARCHAR,
	costo_millas INT
) AS $$
BEGIN
	RETURN QUERY WITH Paquetes_Canjeados AS (
	SELECT DISTINCT pt_cod 
	FROM Paquete_Turistico
	JOIN Compra ON pt_cod = paquete_turistico_pt_cod
	WHERE co_fecha_hora BETWEEN (CURRENT_TIMESTAMP - '6 months'::INTERVAL) AND CURRENT_TIMESTAMP
	AND co_estado = 'FINALIZADO'
	)
	SELECT pt_nombre, pt_descripcion, pt_costo_millas
	FROM Paquete_Turistico pt
	JOIN Paquetes_Canjeados pc ON pt.pt_cod = pc.pt_cod
	ORDER BY pt_costo_millas DESC
	LIMIT 5;
END;
$$ LANGUAGE plpgsql;

-- Millas acumuladas por destino (PAIS)
CREATE OR REPLACE FUNCTION fn_reporte_millas_por_destino()
RETURNS TABLE (
    cedula_cliente INT,
    nombre_cliente VARCHAR,
    pais_destino VARCHAR,
    millas_en_pais BIGINT,
    total_millas_cliente NUMERIC(15),
    ranking_destino INT -- 1 = El destino que más millas generó
) AS $$
BEGIN
    RETURN QUERY
    WITH RECURSIVE 
    -- Encontrar el PAÍS de cualquier lugar
    Jerarquia_Pais AS (
        -- Caso Base: Lugares que ya son PAIS
        SELECT l_cod AS lugar_origen_id, l_cod AS pais_id, l_nombre AS pais_nombre
        FROM Lugar WHERE l_tipo = 'PAIS'
        
        UNION ALL
        
        -- Caso Recursivo: Hijos buscando a su padre
        SELECT c.l_cod, p.pais_id, p.pais_nombre
        FROM Lugar c
        JOIN Jerarquia_Pais p ON c.Lugar_l_cod = p.lugar_origen_id
    ),
    -- Servicios y Millas por Lugar
    Servicios_Unificados AS (
        -- VUELOS
        SELECT c.cliente_c_cod, s.s_millas_otorgar AS millas, v.lugar_l_cod2 AS lugar_id
        FROM Boleto_Vuelo bv
        JOIN Compra c ON bv.compra_co_cod = c.co_cod
        JOIN Vuelo v ON bv.vuelo_s_cod = v.s_cod
        JOIN Servicio s ON v.s_cod = s.s_cod
        WHERE c.co_estado = 'FINALIZADO' AND c.co_es_paquete IS NOT TRUE

        UNION ALL

        -- HOTELES
        SELECT c.cliente_c_cod, s.s_millas_otorgar AS millas, h.lugar_l_cod AS lugar_id
        FROM Detalle_Hospedaje dh
        JOIN Compra c ON dh.compra_co_cod = c.co_cod
        JOIN Habitacion hab ON dh.habitacion_s_cod = hab.s_cod
        JOIN Hotel h ON hab.hotel_p_cod = h.p_cod
        JOIN Servicio s ON hab.s_cod = s.s_cod
        WHERE c.co_estado = 'FINALIZADO' AND c.co_es_paquete IS NOT TRUE

        UNION ALL

        -- TRASLADOS
        SELECT c.cliente_c_cod, s.s_millas_otorgar AS millas, t.lugar_l_cod AS lugar_id
        FROM Detalle_Traslado dt
        JOIN Compra c ON dt.compra_co_cod = c.co_cod
        JOIN Traslado t ON dt.traslado_s_cod = t.s_cod
        JOIN Servicio s ON t.s_cod = s.s_cod
        WHERE c.co_estado = 'FINALIZADO' AND c.co_es_paquete IS NOT TRUE

        UNION ALL

        -- CRUCEROS
        SELECT c.cliente_c_cod, s.s_millas_otorgar, vi.lugar_l_cod2
        FROM Boleto_Viaje bvi
        JOIN Compra c ON bvi.compra_co_cod = c.co_cod
        JOIN Viaje vi ON bvi.viaje_s_cod = vi.s_cod
        JOIN Servicio s ON vi.s_cod = s.s_cod
        WHERE c.co_estado = 'FINALIZADO' AND c.co_es_paquete IS NOT TRUE

        UNION ALL

        -- ACTIVIDADES
        SELECT c.cliente_c_cod, s.s_millas_otorgar, sa.lugar_l_cod
        FROM Entrada_Digital ed
        JOIN Compra c ON ed.compra_co_cod = c.co_cod
        JOIN Servicio_Adicional sa ON ed.servicio_adicional_s_cod = sa.s_cod
        JOIN Servicio s ON sa.s_cod = s.s_cod
        WHERE c.co_estado = 'FINALIZADO' AND c.co_es_paquete IS NOT TRUE
    ),
    -- Agrupación por Cliente y País
    Millas_Agrupadas AS (
        SELECT 
            su.cliente_c_cod, 
            COALESCE(jp.pais_nombre, 'Continental') AS pais, 
            SUM(su.millas) AS total_por_pais
        FROM Servicios_Unificados su
        LEFT JOIN Jerarquia_Pais jp ON su.lugar_id = jp.lugar_origen_id
        GROUP BY su.cliente_c_cod, jp.pais_nombre
    )
    -- Totales y Ranking
    SELECT 
        cli.c_ci,
        (cli.c_p_nombre || ' ' || cli.c_p_apellido)::VARCHAR AS nombre_completo,
        ma.pais,
        ma.total_por_pais,
        SUM(ma.total_por_pais) OVER(PARTITION BY ma.cliente_c_cod) AS total_acumulado,
        RANK() OVER(PARTITION BY ma.cliente_c_cod ORDER BY ma.total_por_pais DESC)::INT as ranking
    FROM Millas_Agrupadas ma
    JOIN Cliente cli ON ma.cliente_c_cod = cli.c_cod
    ORDER BY cli.c_ci, ma.total_por_pais DESC;
END;
$$ LANGUAGE plpgsql;