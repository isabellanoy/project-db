(() => {
  const showStatus = (element, message, type = 'info') => {
    if (!element) return;
    element.textContent = message;
    element.dataset.status = type;
    element.style.display = message ? 'block' : 'none';
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
        showStatus(statusElement, 'Debes ingresar tu correo y contraseña.', 'error');
        return;
      }

      showStatus(statusElement, 'Validando credenciales...', 'info');

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

        if (!response.ok) {
          const message = payload?.p_mensaje || payload?.message || 'Credenciales inválidas';
          showStatus(statusElement, message, 'error');
          return;
        }

        showStatus(statusElement, 'Inicio de sesión exitoso. Redirigiendo...', 'success');
        setTimeout(() => {
          window.location.href = '../home/home.html';
        }, 800);
      } catch (error) {
        showStatus(statusElement, 'No se pudo contactar al servidor. Intenta nuevamente.', 'error');
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
