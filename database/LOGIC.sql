-- ===================================================
-- STORE PROCEDURES Y FUNCIONES
-- ===================================================

-- Obtener la jerarquía completa de un lugar específico (hacia arriba)
CREATE OR REPLACE FUNCTION fn_obtener_ancestros_lugar(p_lugar_cod INT)
	RETURNS TABLE(
	    l_cod INT,
	    l_nombre VARCHAR,
	    l_tipo VARCHAR,
	    nivel INT
	) AS $$
	WITH RECURSIVE lugar_jerarquia AS (
	    -- Caso base: obtener el lugar especificado
	    SELECT l.l_cod, l.l_nombre, l.l_tipo, l.Lugar_l_cod, 0 AS nivel
	    FROM Lugar l
	    WHERE l.l_cod = p_lugar_cod
	    
	    UNION ALL
	    
	    -- Caso recursivo: obtener los ancestros
	    SELECT l.l_cod, l.l_nombre, l.l_tipo, l.Lugar_l_cod, lj.nivel + 1
	    FROM Lugar l
	    INNER JOIN lugar_jerarquia lj ON l.l_cod = lj.Lugar_l_cod
	    WHERE lj.nivel < 10 -- Límite de recursión para evitar loops infinitos
	)
	SELECT lj.l_cod, lj.l_nombre, lj.l_tipo, lj.nivel
	FROM lugar_jerarquia lj
	ORDER BY lj.nivel ASC;
	$$ LANGUAGE SQL;

-- Obtener todos los descendientes de un lugar (hacia abajo)
CREATE OR REPLACE FUNCTION fn_obtener_descendientes_lugar(p_lugar_cod INT)
	RETURNS TABLE(
	    l_cod INT,
	    l_nombre VARCHAR,
	    l_tipo VARCHAR,
	    nivel INT
	) AS $$
	WITH RECURSIVE lugar_jerarquia AS (
	    -- Caso base: obtener el lugar especificado
	    SELECT l.l_cod, l.l_nombre, l.l_tipo, l.Lugar_l_cod, 0 AS nivel
	    FROM Lugar l
	    WHERE l.l_cod = p_lugar_cod
	    
	    UNION ALL
	    
	    -- Caso recursivo: obtener los descendientes
	    SELECT l.l_cod, l.l_nombre, l.l_tipo, l.Lugar_l_cod, lj.nivel + 1
	    FROM Lugar l
	    INNER JOIN lugar_jerarquia lj ON l.Lugar_l_cod = lj.l_cod
	    WHERE lj.nivel < 10 -- Límite de recursión
	)
	SELECT lj.l_cod, lj.l_nombre, lj.l_tipo, lj.nivel
	FROM lugar_jerarquia lj
	ORDER BY lj.nivel ASC;
	$$ LANGUAGE SQL;

-- Obtener la ruta completa de un lugar (camino completo desde la raíz)
CREATE OR REPLACE FUNCTION fn_obtener_ruta_lugar(p_lugar_cod INT)
	RETURNS TEXT AS $$
	DECLARE
	    v_ruta TEXT := '';
	BEGIN
	    WITH RECURSIVE lugar_ruta AS (
	        -- Caso base
	        SELECT l.l_cod, l.l_nombre, l.l_tipo, l.Lugar_l_cod, 0 AS nivel
	        FROM Lugar l
	        WHERE l.l_cod = p_lugar_cod
	        
	        UNION ALL
	        
	        -- Caso recursivo
	        SELECT l.l_cod, l.l_nombre, l.l_tipo, l.Lugar_l_cod, lr.nivel + 1
	        FROM Lugar l
	        INNER JOIN lugar_ruta lr ON l.l_cod = lr.Lugar_l_cod
	        WHERE lr.nivel < 10
	    )
	    SELECT STRING_AGG(lr.l_nombre, ' -> ' ORDER BY lr.nivel DESC)
	    INTO v_ruta
	    FROM lugar_ruta lr;
	    
	    RETURN COALESCE(v_ruta, 'Lugar no encontrado');
	END;
	$$ LANGUAGE plpgsql;

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
		ORDER BY l.l_tipo, l.l_nombre
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
CREATE OR REPLACE FUNCTION fn_buscar_lugar_por_nombre(p_nombre VARCHAR)
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
		WHERE LOWER(l.l_nombre) LIKE LOWER('%' || p_nombre || '%') AND l2.l_cod = l.lugar_l_cod;
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

-- ============================================================================
-- REGISTER: Crear Cliente + Usuario + Método de Pago Millas
-- ============================================================================

-- CREATE OR REPLACE PROCEDURE sp_crear_pago_millas()
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

-- Trigger automatico para las millas de los clientes
CREATE TRIGGER tr_nuevo_cliente_millas
	AFTER INSERT ON Cliente
	FOR EACH ROW
	EXECUTE FUNCTION fn_crear_pago_millas();

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
	        INSERT INTO Cliente (c_CI, c_p_nombre, c_s_nombre, c_p_apellido, c_s_apellido, c_fecha_nacimiento, c_sexo, c_edo_civil) 
			VALUES (
	            p_ci,
	            p_primer_nombre,
	            p_segundo_nombre,
	            p_primer_apellido,
	            p_segundo_apellido,
	            p_fecha_nacimiento,
	            p_sexo,
	            p_estado_civil
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

-- ============================================================================
-- LOGIN: Validar credenciales y retornar información del usuario
-- ============================================================================
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

-- ============================================================================
-- OBTENER INFORMACIÓN COMPLETA DEL CLIENTE
-- ============================================================================
CREATE OR REPLACE PROCEDURE sp_obtener_cliente_por_usuario(
    p_usuario_cod INT,
    OUT p_cliente_cod INT,
    OUT p_ci INT,
    OUT p_nombre_completo VARCHAR,
    OUT p_correo VARCHAR,
    OUT p_fecha_nacimiento DATE,
    OUT p_sexo CHAR,
    OUT p_estado_civil VARCHAR,
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
	        COALESCE(mp.m_cant_acumulada, 0)
	    INTO 
	        p_cliente_cod,
	        p_ci,
	        p_nombre_completo,
	        p_correo,
	        p_fecha_nacimiento,
	        p_sexo,
	        p_estado_civil,
	        p_millas_disponibles
	    FROM Usuario u
	    INNER JOIN Cliente c ON u.Cliente_c_cod = c.c_cod
	    LEFT JOIN Metodo_Pago mp ON c.c_cod = mp.m_Cliente_cod
	    WHERE u.u_cod = p_usuario_cod;
	END;
	$$;

-- ============================================================================
-- VALIDAR PERMISOS DEL USUARIO
-- ============================================================================
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

-- ============================================================================
-- CAMBIAR CONTRASEÑA
-- ============================================================================
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
	    mensaje VARCHAR,
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
	            'El nombre del rol no puede estar vacío'::VARCHAR,
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
	            'Ya existe un rol con ese nombre'::VARCHAR,
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
	    CASE p_tipo_proveedor
	        WHEN 'Aerolinea' THEN
	            RETURN EXISTS (
	                SELECT 1 FROM Vuelo v
	                WHERE v.s_cod = p_id_servicio
	            );
	        WHEN 'Crucero' THEN
	            RETURN EXISTS (
	                SELECT 1 FROM Viaje v
	                WHERE v.s_cod = p_id_servicio
	            );
	        WHEN 'Transporte' THEN
	            RETURN EXISTS (
	                SELECT 1 FROM Traslado t
	                WHERE t.s_cod = p_id_servicio
	                AND t.Transporte_Terrestre_p_cod = p_id_proveedor
	            );
	        WHEN 'Hotel' THEN
	            RETURN EXISTS (
	                SELECT 1 FROM Habitacion h
	                WHERE h.s_cod = p_id_servicio
	                AND h.Hotel_p_cod = p_id_proveedor
	            );
	        WHEN 'Operador' THEN
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
	    mensaje VARCHAR,
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
	        RETURN QUERY SELECT false, 101, 'El porcentaje debe estar entre 1 y 90', NULL;
	        RETURN;
	    END IF;
	
	    IF p_nombre IS NULL OR TRIM(p_nombre) = '' THEN
	        RETURN QUERY SELECT false, 102, 'El nombre de la promoción no puede estar vacío', NULL;
	        RETURN;
	    END IF;
	
	    IF p_servicios_ids IS NULL OR ARRAY_LENGTH(p_servicios_ids, 1) = 0 THEN
	        RETURN QUERY SELECT false, 103, 'Debe proporcionar al menos un servicio para la promoción', NULL;
	        RETURN;
	    END IF;
	
	    -- Validar que el tipo de proveedor sea válido
	    IF p_tipo_proveedor NOT IN ('Aerolinea', 'Crucero', 'Transporte', 'Hotel', 'Operador') THEN
	        RETURN QUERY SELECT false, 104, 'Tipo de proveedor inválido', NULL;
	        RETURN;
	    END IF;
	
	    BEGIN
	        -- Crear la promoción según el tipo de proveedor
	        CASE p_tipo_proveedor
	            WHEN 'Aerolinea' THEN
	                INSERT INTO Promocion (pr_nombre, pr_porcentaje, Aerolinea_p_cod)
	                VALUES (p_nombre, p_porcentaje, p_id_proveedor)
	                RETURNING pr_cod INTO v_id_promocion;
	            WHEN 'Crucero' THEN
	                INSERT INTO Promocion (pr_nombre, pr_porcentaje, Crucero_p_cod)
	                VALUES (p_nombre, p_porcentaje, p_id_proveedor)
	                RETURNING pr_cod INTO v_id_promocion;
	            WHEN 'Transporte' THEN
	                INSERT INTO Promocion (pr_nombre, pr_porcentaje, Transporte_Terrestre_p_cod)
	                VALUES (p_nombre, p_porcentaje, p_id_proveedor)
	                RETURNING pr_cod INTO v_id_promocion;
	            WHEN 'Hotel' THEN
	                INSERT INTO Promocion (pr_nombre, pr_porcentaje, Hotel_p_cod)
	                VALUES (p_nombre, p_porcentaje, p_id_proveedor)
	                RETURNING pr_cod INTO v_id_promocion;
	            WHEN 'Operador' THEN
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
	                RETURN QUERY SELECT false, 105, 'Servicio con código ' || v_id_servicio || ' no existe', NULL;
	                RETURN;
	            END IF;
	
	            -- Obtener el costo del servicio
	            SELECT s_costo INTO v_costo_servicio FROM Servicio WHERE s_cod = v_id_servicio;
	
	            -- Validar que el servicio pertenece al mismo proveedor
	            v_tipo_proveedor_servicio := fn_obtener_tipo_proveedor_servicio(v_id_servicio);
	            
	            IF v_tipo_proveedor_servicio IS NULL THEN
	                DELETE FROM Promocion WHERE pr_cod = v_id_promocion;
	                RETURN QUERY SELECT false, 106, 'No se pudo determinar el proveedor del servicio ' || v_id_servicio, NULL;
	                RETURN;
	            END IF;
	
	            -- Validar que el tipo de proveedor del servicio coincida
	            IF v_tipo_proveedor_servicio != p_tipo_proveedor THEN
	                DELETE FROM Promocion WHERE pr_cod = v_id_promocion;
	                RETURN QUERY SELECT false, 107, 'El servicio ' || v_id_servicio || ' no pertenece a un ' || p_tipo_proveedor, NULL;
	                RETURN;
	            END IF;
	
	            -- Validar que el proveedor del servicio sea el mismo que el de la promoción
	            IF NOT fn_validar_proveedor_servicio(v_id_servicio, p_id_proveedor, p_tipo_proveedor) THEN
	                DELETE FROM Promocion WHERE pr_cod = v_id_promocion;
	                RETURN QUERY SELECT false, 108, 'El servicio ' || v_id_servicio || ' no pertenece al proveedor especificado', NULL;
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
	        RETURN QUERY SELECT false, 999, 'Error al registrar promoción: ' || SQLERRM, NULL;
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
	            WHEN p.Aerolinea_p_cod IS NOT NULL THEN 'Aerolinea'
	            WHEN p.Crucero_p_cod IS NOT NULL THEN 'Crucero'
	            WHEN p.Transporte_Terrestre_p_cod IS NOT NULL THEN 'Transporte'
	            WHEN p.Hotel_p_cod IS NOT NULL THEN 'Hotel'
	            WHEN p.Operador_Turistico_p_cod IS NOT NULL THEN 'Operador'
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
	    mensaje VARCHAR,
	    servicios_eliminados INT
	) AS $$
	DECLARE
	    v_id_servicio INT;
	    v_contador INT := 0;
	    v_total_servicios INT;
	BEGIN
	    -- Validar que la promoción existe
	    IF NOT EXISTS (SELECT 1 FROM Promocion WHERE pr_cod = p_id_promocion) THEN
	        RETURN QUERY SELECT false, 301, 'La promoción con código ' || p_id_promocion || ' no existe', NULL;
	        RETURN;
	    END IF;
	
	    -- Validar servicios no vacío
	    IF p_servicios_ids IS NULL OR ARRAY_LENGTH(p_servicios_ids, 1) = 0 THEN
	        RETURN QUERY SELECT false, 302, 'Debe proporcionar al menos un servicio', NULL;
	        RETURN;
	    END IF;
	
	    BEGIN
	        -- Contar servicios actuales de la promoción
	        SELECT COUNT(*) INTO v_total_servicios FROM Pro_Ser WHERE Promocion_pr_cod = p_id_promocion;
	
	        -- Validar que no sea el último servicio (una promoción debe tener al menos 1 servicio)
	        IF v_total_servicios - ARRAY_LENGTH(p_servicios_ids, 1) < 1 THEN
	            RETURN QUERY SELECT false, 303, 'Una promoción debe tener al menos un servicio. Actualmente tiene ' || v_total_servicios, NULL;
	            RETURN;
	        END IF;
	
	        -- Procesar eliminación de servicios
	        FOREACH v_id_servicio IN ARRAY p_servicios_ids
	        LOOP
	            -- Validar que el servicio está en la promoción
	            IF NOT EXISTS (SELECT 1 FROM Pro_Ser WHERE Promocion_pr_cod = p_id_promocion AND Servicio_s_cod = v_id_servicio) THEN
	                RETURN QUERY SELECT false, 304, 'El servicio ' || v_id_servicio || ' no está asociado a esta promoción', NULL;
	                RETURN;
	            END IF;
	
	            -- Eliminar el servicio
	            DELETE FROM Pro_Ser 
	            WHERE Promocion_pr_cod = p_id_promocion AND Servicio_s_cod = v_id_servicio;
	
	            v_contador := v_contador + 1;
	        END LOOP;
	
	        RETURN QUERY SELECT true, 0, 'Se eliminaron ' || v_contador || ' servicios exitosamente', v_contador;
	
	    EXCEPTION WHEN OTHERS THEN
	        RETURN QUERY SELECT false, 999, 'Error al eliminar servicios: ' || SQLERRM, NULL;
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
	    mensaje VARCHAR
	) AS $$
	DECLARE
	    v_cambios_realizados INT := 0;
	BEGIN
	    -- Validar que la promoción existe
	    IF NOT EXISTS (SELECT 1 FROM Promocion WHERE pr_cod = p_id_promocion) THEN
	        RETURN QUERY SELECT false, 401, 'La promoción con código ' || p_id_promocion || ' no existe';
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
	
	        RETURN QUERY SELECT true, 0, 'Promoción actualizada exitosamente. ' || v_cambios_realizados || ' campo(s) modificado(s)';
	
	    EXCEPTION WHEN OTHERS THEN
	        RETURN QUERY SELECT false, 999, 'Error al actualizar promoción: ' || SQLERRM;
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
	    mensaje VARCHAR
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