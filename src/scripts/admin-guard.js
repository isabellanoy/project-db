(async function() {
  const userId = localStorage.getItem('userId');
  
  if (!userId) {
    alert('Acceso denegado. Por favor inicia sesión.');
    window.location.href = '/login';
    return;
  }

  // Verificación de Permiso Específico
  // Mapa de rutas a sus permisos requeridos
  const requiredPermissions = {
    '/admin/reportes': 'ver_reportes_financieros',
    '/mis-viajes': 'ver_mis_pagos',
    '/perfil': 'ver_mi_perfil',
    '/busqueda': 'ver_servicios',
    '/admin/promociones': 'gestionar_promociones',
    '/admin/roles': 'gestionar_roles',
    '/admin/paquetes': 'gestionar_paquetes',
    '/admin/usuarios': 'gestionar_usuarios',
    '/admin/proveedores': 'gestionar_proveedores'
  };

  const currentPage = window.location.pathname;
  
  const requiredPermission = requiredPermissions[currentPage];

  // Si la página actual no está en el mapa, el chequeo de rol es suficiente.
  if (!requiredPermission) {
    return;
  }

  // Si se requiere un permiso, se llama al endpoint para verificarlo.
  try {
    const response = await fetch(`/api/auth/has-permission?usuario_cod=${userId}&permiso=${requiredPermission}`);
    
    if (!response.ok) {
        // Si la respuesta del fetch no es 2xx, algo falló en el servidor
        const errorInfo = await response.json();
        throw new Error(errorInfo.message || 'Error del servidor al verificar permisos.');
    }

    const data = await response.json();

    if (!data.ok || !data.data.tiene_permiso) {
      // El usuario no tiene el permiso, aunque el rol sea correcto.
      throw new Error(`No tienes el permiso específico necesario: "${requiredPermission}"`);
    }
  } catch (error) {
    alert(`Acceso denegado: ${error.message}`);
    // Redirigir a '/home' por defecto.
    window.location.href = '/home';
  }
})();
