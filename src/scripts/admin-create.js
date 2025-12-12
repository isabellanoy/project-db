(() => {
  const urlParams = new URLSearchParams(window.location.search);
  const type = urlParams.get('type') || 'aerolineas';
  
  const form = document.getElementById('createForm');
  const title = document.getElementById('formTitle');
  const lugarSelect = document.getElementById('lugarSelect');
  const extraFields = document.getElementById('extraFields');

  title.textContent = `Registrar ${type.replace('-', ' ').toUpperCase()}`;

  // Campos específicos
  if (type === 'aerolineas' || type === 'cruceros') {
    extraFields.innerHTML = `
        <label>Fecha de Constitución</label>
        <input type="date" name="fecha_constitucion" class="form-input" required>
    `;
  } else if (type === 'hoteles') {
    extraFields.innerHTML = `
        <label>Dirección Física</label>
        <input type="text" name="h_direccion" class="form-input" required placeholder="Calle, Avenida...">
    `;
  }

  const loadLugares = async () => {
    try {
      const res = await fetch('/api/locations?limit=500');
      const payload = await res.json();
      
      if(payload.ok) {
        lugarSelect.innerHTML = '<option value="">Seleccione una ubicación</option>' + 
          payload.data.map(l => `<option value="${l.cod}">${l.nombre} (${l.tipo})</option>`).join('');
      }
    } catch (e) {
      lugarSelect.innerHTML = '<option>Error cargando lugares</option>';
    }
  };

  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    const formData = new FormData(form);
    const data = Object.fromEntries(formData.entries());

    // Ajustes de datos según tipo (para cumplir con el backend)
    if(type !== 'aerolineas') {
        data.p_nombre = data.nombre;
        data.p_fecha_afiliacion = new Date().toISOString().split('T')[0];
        
        if(type === 'hoteles') data.h_direccion = data.h_direccion;
        if(type === 'cruceros') data.c_fecha_constitucion = data.fecha_constitucion;
    }

    try {
      const res = await fetch(`/api/providers/${type}`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
      });

      const result = await res.json();

      if(result.ok) {
        alert('Proveedor creado exitosamente');
        window.location.href = '/admin/proveedores';
      } else {
        alert('Error: ' + (result.message || result.p_mensaje));
      }
    } catch (error) {
      alert('Error de conexión');
    }
  });

  loadLugares();
})();