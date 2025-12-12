(() => {
  const urlParams = new URLSearchParams(window.location.search);
  const type = urlParams.get('type');
  const id = urlParams.get('id');

  const form = document.getElementById('editForm');
  const nombreInput = document.getElementById('nombreInput');
  const lugarSelect = document.getElementById('lugarSelectEdit');
  const extraFields = document.getElementById('extraFieldsEdit');

  if (!id || !type) {
    alert('Datos faltantes');
    window.location.href = '/admin/proveedores';
  }

  if (type === 'hoteles') {
    extraFields.innerHTML = `
        <label>Dirección</label>
        <input type="text" name="h_direccion" id="direccionInput" class="form-input">
    `;
  }

  const loadData = async () => {
    // 1. Lugares
    const resLug = await fetch('/api/locations?limit=500');
    const lugPayload = await resLug.json();
    lugarSelect.innerHTML = lugPayload.data.map(l => `<option value="${l.cod}">${l.nombre}</option>`).join('');

    // 2. Proveedor
    const resProv = await fetch(`/api/providers/${type}/${id}`);
    const provPayload = await resProv.json();
    
    if (provPayload.ok) {
        const item = provPayload.data;
        nombreInput.value = item.p_nombre || item.nombre;
        lugarSelect.value = item.lugar_l_cod || item.lugar_cod;

        if(type === 'hoteles' && item.h_direccion) {
            document.getElementById('direccionInput').value = item.h_direccion;
        }
    } else {
        alert('No se pudo cargar el proveedor');
        window.location.href = '/admin/proveedores';
    }
  };

  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    const formData = new FormData(form);
    const data = Object.fromEntries(formData.entries());

    // Mapeo
    data.p_nombre = data.nombre;

    try {
        const res = await fetch(`/api/providers/${type}/${id}`, {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data)
        });
        
        const result = await res.json();

        if(result.ok) {
            alert('Actualizado correctamente');
            window.location.href = '/admin/proveedores';
        } else {
            alert('Error: ' + (result.message || result.p_mensaje));
        }
    } catch(err) {
        console.error(err);
        alert('Error de conexión');
    }
  });

  loadData();
})();