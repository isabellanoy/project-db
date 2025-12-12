(() => {
  const userId = localStorage.getItem('userId');

  // Validación de seguridad
  if (!userId) {
    window.location.href = '/login';
    return;
  }

  // Elementos del DOM
  const elements = {
    headerName: document.querySelector('.sidebar__title h3'),
    welcomeTitle: document.querySelector('.dashboard-header h1'),
    milesDisplay: document.querySelector('.big-number'),
    inputName: document.querySelector('input[name="fullname"]'),
    inputEmail: document.querySelector('input[type="email"]'),
    inputId: document.querySelector('input[name="ci"]'),
    logoutBtn: document.getElementById('logoutBtn')
  };

  const loadProfile = async () => {
    try {
      const response = await fetch(`/api/auth/me?usuario_cod=${userId}`);
      const payload = await response.json();

      if (!payload.ok) throw new Error(payload.message);

      const data = payload.data;

      if(elements.headerName) elements.headerName.textContent = `Panel ${data.nombre_corto}`;

      if(elements.milesDisplay) {
        elements.milesDisplay.textContent = `${data.millas} millas`;
      }

      if(elements.inputName) elements.inputName.value = data.nombre;
      if(elements.inputEmail) elements.inputEmail.value = data.correo;
      if(elements.inputId) elements.inputId.value = data.ci;

    } catch (error) {
      console.error(error);
      alert('Error cargando perfil. Por favor inicia sesión nuevamente.');
    }
  };

  const logout = () => {
    localStorage.clear();
    window.location.href = '/login';
  };

  document.addEventListener('DOMContentLoaded', () => {
    loadProfile();
    
    const logoutButtons = document.querySelectorAll('a[href*="login"], #logoutBtn');
    logoutButtons.forEach(btn => {
      btn.addEventListener('click', (e) => {
        e.preventDefault();
        logout();
      });
    });
  });

})();