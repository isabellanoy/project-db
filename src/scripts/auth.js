(() => {
  // Función para mostrar mensajes de estado (éxito/error)
  const showStatus = (element, message, type = 'info') => {
    if (!element) return;
    element.textContent = message;
    element.className = `form-status status-${type}`;
    element.style.display = message ? 'block' : 'none';
    
    element.style.color = type === 'error' ? '#ef4444' : type === 'success' ? '#10b981' : '#3b82f6';
    element.style.marginTop = '10px';
    element.style.fontSize = '0.9rem';
  };

  const handleLoginSubmit = (form) => {
    const emailInput = form.querySelector('#email');
    const passwordInput = form.querySelector('#password');
    const statusElement = form.querySelector('[data-login-status]');

    if (!emailInput || !passwordInput) return;

    form.addEventListener('submit', async (event) => {
      event.preventDefault();

      const usernameOrEmail = emailInput.value.trim();
      const password = passwordInput.value;

      if (!usernameOrEmail || !password) {
        showStatus(statusElement, 'Por favor ingresa usuario/correo y contraseña.', 'error');
        return;
      }

      showStatus(statusElement, 'Validando credenciales...', 'info');
      const submitBtn = form.querySelector('button[type="submit"]');
      if(submitBtn) submitBtn.disabled = true;

      try {
        const response = await fetch('/api/auth/login', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            username_o_email: usernameOrEmail,
            clave: password
          })
        });

        const payload = await response.json().catch(() => ({}));

        if (!response.ok || !payload.ok) {
          const message = payload.message || payload.p_mensaje || 'Credenciales inválidas';
          throw new Error(message);
        }

        // GUARDAR SESIÓN 
        // Guardamos el ID que nos devolvió el backend para usarlo en las compras
        if (payload.data) {
            localStorage.setItem('userId', payload.data.id);
            localStorage.setItem('username', payload.data.username);
            localStorage.setItem('userRole', payload.data.role);
            console.log('Sesión iniciada para:', payload.data.username);
        }
        // -------------------------------------

        showStatus(statusElement, '¡Login exitoso! Redirigiendo...', 'success');
        
        // Redirigir al home o al dashboard según corresponda
        setTimeout(() => {
          // Si es admin, podríamos enviarlo al panel administrativo
          if (payload.data.role === 'Administrador' || payload.data.role === 'Gerente de Ventas') {
             window.location.href = '../admin/reports.html'; 
          } else {
             window.location.href = '../home/home.html';
          }
        }, 1000);

      } catch (error) {
        console.error(error);
        showStatus(statusElement, error.message || 'Error de conexión. Intenta nuevamente.', 'error');
        if(submitBtn) submitBtn.disabled = false;
      }
    });
  };

  document.addEventListener('DOMContentLoaded', () => {
    const loginForm = document.querySelector('[data-login-form]');
    if (loginForm) {
      handleLoginSubmit(loginForm);
    }
  });
})();