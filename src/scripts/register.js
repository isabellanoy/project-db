(() => {
    const form = document.getElementById('registerForm');
    const lugarSelect = document.getElementById('lugarSelect');
    const messageBox = document.getElementById('formMessage');
    const submitBtn = form.querySelector('button[type="submit"]');
  
    // 1. Cargar Lugares (Parroquias/Ciudades)
    const loadLocations = async () => {
      try {
        // Pedimos un limite alto para traer suficientes lugares para probar
        const response = await fetch('/api/locations?limit=1000');
        const payload = await response.json();
        
        if (payload.ok) {
          // Filtramos para mostrar lugares lógicos para vivir (Parroquias o Ciudades)
          const validTypes = ['PARROQUIA', 'CIUDAD', 'MUNICIPIO'];
          
          const options = payload.data
            .filter(l => validTypes.includes(l.tipo?.toUpperCase()))
            .map(l => `<option value="${l.cod}">${l.nombre} (${l.tipo})</option>`)
            .join('');
            
          lugarSelect.innerHTML = '<option value="">Seleccione su ubicación...</option>' + options;
        } else {
          lugarSelect.innerHTML = '<option value="">Error cargando lugares</option>';
        }
      } catch (error) {
        console.error('Error cargando lugares:', error);
        lugarSelect.innerHTML = '<option value="">Error de conexión</option>';
      }
    };
  
    // 2. Manejar Envío
    form.addEventListener('submit', async (e) => {
      e.preventDefault();
      
      // Bloquear botón y limpiar mensajes
      submitBtn.disabled = true;
      submitBtn.textContent = 'Registrando...';
      messageBox.style.display = 'none';
      messageBox.className = 'form-status';
  
      // Capturar datos
      const formData = new FormData(form);
      const data = Object.fromEntries(formData.entries());
  
      // Validaciones básicas extras frontend (opcional)
      if (data.clave.length < 4) {
        showMessage('La contraseña debe tener al menos 4 caracteres', 'error');
        submitBtn.disabled = false;
        submitBtn.textContent = 'Registrarse';
        return;
      }
  
      try {
        const response = await fetch('/api/auth/register', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(data)
        });
  
        const result = await response.json();
  
        if (response.ok && result.ok) {
          showMessage('¡Registro exitoso! Redirigiendo al login...', 'success');
          setTimeout(() => {
            window.location.href = '/login';
          }, 2000);
        } else {
          // Mostrar error del backend (ej: "Email ya registrado")
          const errorMsg = result.message || 'Error desconocido al registrarse';
          showMessage(errorMsg, 'error');
          submitBtn.disabled = false;
          submitBtn.textContent = 'Registrarse';
        }
      } catch (error) {
        console.error(error);
        showMessage('Error de conexión con el servidor', 'error');
        submitBtn.disabled = false;
        submitBtn.textContent = 'Registrarse';
      }
    });
  
    // Helper para mostrar mensajes
    const showMessage = (text, type) => {
      messageBox.textContent = text;
      messageBox.style.display = 'block';
      if (type === 'error') {
        messageBox.style.color = '#ef4444';
        messageBox.style.backgroundColor = '#fef2f2';
        messageBox.style.padding = '10px';
        messageBox.style.borderRadius = '5px';
        messageBox.style.border = '1px solid #fecaca';
      } else {
        messageBox.style.color = '#10b981';
        messageBox.style.backgroundColor = '#ecfdf5';
        messageBox.style.padding = '10px';
        messageBox.style.borderRadius = '5px';
        messageBox.style.border = '1px solid #a7f3d0';
      }
    };
  
    // Inicializar
    loadLocations();
  })();