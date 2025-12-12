(() => {
  const tableBody = document.querySelector('[data-providers-body]');
  const providerTypeSelect = document.getElementById('providerType');
  const addBtn = document.getElementById('addBtn');
  const searchInput = document.getElementById('searchInput');

  let currentData = [];

  const formatDate = (dateString) => {
    if (!dateString) return '-';
    return new Date(dateString).toLocaleDateString('es-ES');
  };

  const renderTable = (data) => {
    if (!data || data.length === 0) {
      tableBody.innerHTML = `<tr><td colspan="4" style="text-align:center; padding:1.5rem;">No se encontraron registros.</td></tr>`;
      return;
    }

    tableBody.innerHTML = data.map(item => `
      <tr>
        <td>${item.p_cod || item.cod}</td>
        <td>${item.p_nombre || item.nombre}</td>
        <td>${formatDate(item.p_fecha_afiliacion || item.fecha_afiliacion)}</td>
        <td class="action-links">
          <a href="/admin/editar?type=${providerTypeSelect.value}&id=${item.p_cod || item.cod}">Editar</a>
          <a href="/admin/eliminar?type=${providerTypeSelect.value}&id=${item.p_cod || item.cod}" style="color: #ef4444;">Eliminar</a>
        </td>
      </tr>
    `).join('');
  };

  const loadProviders = async () => {
    const type = providerTypeSelect.value;
    tableBody.innerHTML = `<tr><td colspan="4" style="text-align:center; padding:1.5rem;">Cargando...</td></tr>`;

    try {
      const response = await fetch(`/api/providers/${type}`);
      const payload = await response.json();
      
      if(payload.ok) {
        currentData = payload.data;
        renderTable(currentData);
      } else {
        tableBody.innerHTML = `<tr><td colspan="4" style="text-align:center; color:red;">${payload.message}</td></tr>`;
      }
    } catch (error) {
      console.error(error);
      tableBody.innerHTML = `<tr><td colspan="4" style="text-align:center; color:red;">Error de conexión</td></tr>`;
    }
  };

  // Event Listeners
  providerTypeSelect.addEventListener('change', loadProviders);
  
  // Redirección al crear
  addBtn.addEventListener('click', () => {
    window.location.href = `/admin/crear?type=${providerTypeSelect.value}`;
  });

  searchInput.addEventListener('input', (e) => {
    const term = e.target.value.toLowerCase();
    const filtered = currentData.filter(item => 
      (item.p_nombre || item.nombre || '').toLowerCase().includes(term)
    );
    renderTable(filtered);
  });

  // Carga inicial
  loadProviders();
})();