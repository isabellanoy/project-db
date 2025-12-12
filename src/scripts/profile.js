(() => {
  const userId = localStorage.getItem('userId');

  // Validación de seguridad
  if (!userId) {
    window.location.href = '/login';
    return;
  }

  // Elementos del DOM
  const elements = {
    headerName: document.querySelector('.sidebar__title h3'), // "Panel [Nombre]"
    welcomeTitle: document.querySelector('.dashboard-header h1'), // "Hola, [Nombre]"
    milesDisplay: document.querySelector('.big-number'), // Contador de millas
    inputName: document.querySelector('input[name="fullname"]'),
    inputEmail: document.querySelector('input[type="email"]'),
    inputId: document.querySelector('input[name="ci"]'), // Agregaremos este input
    logoutBtn: document.getElementById('logoutBtn')
  };

  const loadProfile = async () => {
    try {
      const response = await fetch(`/api/auth/me?usuario_cod=${userId}`);
      const payload = await response.json();

      if (!payload.ok) throw new Error(payload.message);

      const data = payload.data;

      // 1. Actualizar textos de bienvenida
      if(elements.headerName) elements.headerName.textContent = `Panel ${data.nombre_corto}`;
      // Ajustamos el título si queremos que diga el nombre
      // if(elements.welcomeTitle) elements.welcomeTitle.textContent = `Hola, ${data.nombre_corto}`;

      // 2. Actualizar Millas
      if(elements.milesDisplay) {
        elements.milesDisplay.textContent = `${data.millas} millas`;
      }

      // 3. Llenar formulario (solo lectura)
      if(elements.inputName) elements.inputName.value = data.nombre;
      if(elements.inputEmail) elements.inputEmail.value = data.correo;
      if(elements.inputId) elements.inputId.value = data.ci;

    } catch (error) {
      console.error(error);
      alert('Error cargando perfil. Por favor inicia sesión nuevamente.');
      // logout();
    }
  };

  const logout = () => {
    localStorage.clear();
    window.location.href = '/login';
  };

  // Inicializar
  document.addEventListener('DOMContentLoaded', () => {
    loadProfile();
    
    // Configurar botones de cerrar sesión (puede haber varios)
    const logoutButtons = document.querySelectorAll('a[href*="login"], #logoutBtn');
    logoutButtons.forEach(btn => {
      btn.addEventListener('click', (e) => {
        e.preventDefault();
        logout();
      });
    });
  });

})();