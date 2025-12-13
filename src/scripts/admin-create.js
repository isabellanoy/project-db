(() => {
  const urlParams = new URLSearchParams(window.location.search);
  const type = urlParams.get('type') || 'aerolineas';
  
  const form = document.getElementById('createForm');
  const title = document.getElementById('formTitle');
  const lugarSelect = document.getElementById('lugarSelect');
  const extraFields = document.getElementById('extraFields');
  
  // Título
  title.textContent = `Registrar ${type.replace('-', ' ').toUpperCase()}`;

  // Lógica Especial para PAQUETES
  if (type === 'paquetes') {
    // 1. Ocultar selector de lugar (los paquetes no tienen un lugar único fijo en la tabla principal)
    if(lugarSelect) lugarSelect.closest('.form-row').style.display = 'none';
    if(lugarSelect) lugarSelect.required = false;

    // 2. Inyectar campos de Paquete
    extraFields.innerHTML = `
        <div class="form-row">
            <label>Descripción</label>
            <textarea name="descripcion" class="form-input" required></textarea>
        </div>
        <div class="form-row" style="display:flex; gap:1rem;">
            <div style="flex:1">
                <label>Costo ($)</label>
                <input type="number" name="costo" class="form-input" required min="0" step="0.01">
            </div>
            <div style="flex:1">
                <label>Costo en Millas</label>
                <input type="number" name="costo_millas" class="form-input" required min="0">
            </div>
            <div style="flex:1">
                <label>Personas</label>
                <input type="number" name="personas" class="form-input" required min="1">
            </div>
        </div>
        <div class="form-row">
            <label>IDs de Servicios (separados por coma)</label>
            <input type="text" name="servicios_input" class="form-input" placeholder="Ej: 1, 5, 23">
            <small style="color:#666;">Ingrese los IDs de los vuelos, hoteles, etc. que componen el paquete.</small>
        </div>
    `;
  } else {
    // Lógica para Proveedores normales (Aerolineas, Hoteles, etc.)
    if (type === 'aerolineas' || type === 'cruceros') {
        extraFields.innerHTML = `<label>Fecha de Constitución</label><input type="date" name="fecha_constitucion" class="form-input" required>`;
    } else if (type === 'hoteles') {
        extraFields.innerHTML = `<label>Dirección Física</label><input type="text" name="h_direccion" class="form-input" required>`;
    }
    
    // Cargar Lugares
    fetch('/api/locations?limit=500')
        .then(res => res.json())
        .then(payload => {
            if(payload.ok && lugarSelect) {
                lugarSelect.innerHTML = '<option value="">Seleccione...</option>' + 
                payload.data.map(l => `<option value="${l.cod}">${l.nombre} (${l.tipo})</option>`).join('');
            }
        });
  }

  // Manejo del Submit
  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    const formData = new FormData(form);
    const data = Object.fromEntries(formData.entries());
    let endpoint = `/api/providers/${type}`; // Por defecto

    // Ajuste de datos para Paquetes
    if (type === 'paquetes') {
        endpoint = '/api/services/paquetes'; // Ruta específica definida en services.routes.js
        
        // Convertir string "1, 2, 3" a array [1, 2, 3]
        if (data.servicios_input) {
            data.servicios = data.servicios_input.split(',').map(s => parseInt(s.trim())).filter(n => !isNaN(n));
        }
        delete data.servicios_input;
    } 
    // Ajuste para Proveedores
    else {
        if(type !== 'aerolineas') {
            data.p_nombre = data.nombre;
            data.p_fecha_afiliacion = new Date().toISOString().split('T')[0];
            if(type === 'hoteles') data.h_direccion = data.h_direccion;
            if(type === 'cruceros') data.c_fecha_constitucion = data.fecha_constitucion;
        }
    }

    try {
      const res = await fetch(endpoint, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
      });

      const result = await res.json();

      if(result.ok) {
        alert('Registrado exitosamente');
        // Redirigir a la lista correcta (para paquetes, no hay vista de lista admin aun, redirigimos a home o search)
        if(type==='paquetes') window.location.href = '/busqueda?type=paquetes';
        else window.location.href = '/admin/proveedores';
      } else {
        alert('Error: ' + (result.message || result.p_mensaje));
      }
    } catch (error) {
      console.error(error);
      alert('Error de conexión');
    }
  });
})();