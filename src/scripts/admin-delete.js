(() => {
  const urlParams = new URLSearchParams(window.location.search);
  const type = urlParams.get('type');
  const id = urlParams.get('id');

  const btn = document.getElementById('confirmDeleteBtn');
  const nameLabel = document.getElementById('providerName');

  // Cargar nombre para confirmar
  fetch(`/api/providers/${type}/${id}`)
    .then(res => res.json())
    .then(payload => {
        if(payload.ok) nameLabel.textContent = payload.data.p_nombre || payload.data.nombre;
    });

  btn.addEventListener('click', async () => {
    btn.disabled = true;
    btn.textContent = 'Eliminando...';

    try {
        const res = await fetch(`/api/providers/${type}/${id}`, { method: 'DELETE' });
        const result = await res.json();

        if(result.ok) {
            alert('Eliminado exitosamente');
            window.location.href = '/admin/proveedores';
        } else {
            // Mostrar mensaje de error (ej: si tiene dependencias y el SP lo impide)
            alert('Error: ' + (result.message || result.p_mensaje));
            window.location.href = '/admin/proveedores';
        }
    } catch(err) {
        console.error(err);
        alert('Error de red');
    }
  });
})();