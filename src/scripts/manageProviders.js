(() => {
  const renderProviders = (tableBody, providers = []) => {
    if (!tableBody) return;

    if (!Array.isArray(providers) || providers.length === 0) {
      tableBody.innerHTML = `
        <tr>
          <td colspan="4" style="text-align: center; padding: 1.5rem; color: #475569;">
            No hay aerolíneas registradas todavía.
          </td>
        </tr>
      `;
      return;
    }

    const rows = providers
      .map((provider) => {
        const id = provider.cod ?? provider.p_cod ?? '-';
        const nombre = provider.nombre ?? provider.p_nombre ?? 'Sin nombre';
        const tipo = provider.tipo ?? 'Aerolínea';

        return `
          <tr>
            <td>${id}</td>
            <td>${nombre}</td>
            <td>${tipo}</td>
            <td class="action-links">
              <a href="#" data-action="view" data-id="${id}">Ver</a>
              <a href="#" data-action="edit" data-id="${id}">Editar</a>
              <a href="#" data-action="delete" data-id="${id}" style="color: #ef4444;">Eliminar</a>
            </td>
          </tr>
        `;
      })
      .join('');

    tableBody.innerHTML = rows;
  };

  const showStatus = (element, message, type = 'info') => {
    if (!element) return;
    element.textContent = message;
    element.dataset.status = type;
    element.style.display = message ? 'block' : 'none';
  };

  const fetchProviders = async (tableBody, statusElement) => {
    showStatus(statusElement, 'Cargando aerolíneas...', 'info');

    try {
      const response = await fetch('/api/aerolineas');
      const payload = await response.json().catch(() => []);

      if (!response.ok) {
        throw new Error(payload?.message || 'No se pudo obtener la lista de aerolíneas');
      }

      renderProviders(tableBody, payload);
      showStatus(statusElement, `Se cargaron ${payload.length} aerolínea(s).`, 'success');
    } catch (error) {
      renderProviders(tableBody, []);
      showStatus(statusElement, error.message, 'error');
    }
  };

  document.addEventListener('DOMContentLoaded', () => {
    const tableBody = document.querySelector('[data-providers-body]');
    if (!tableBody) return;

    const statusElement = document.querySelector('[data-providers-status]');
    fetchProviders(tableBody, statusElement);
  });
})();
