(function() {
  const userRole = localStorage.getItem('userRole');
  const allowedRoles = ['Administrador', 'Gerente de Ventas'];

  if (!userRole) {
    alert('Acceso denegado. Por favor inicia sesión.');
    window.location.href = '/login';
    return;
  }

  if (!allowedRoles.includes(userRole)) {
    alert('Acceso denegado. No tienes permisos para acceder a esta sección.');
    window.location.href = '/home';
    return;
  }
})();
