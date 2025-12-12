(() => {
  const userId = localStorage.getItem('userId');
  const container = document.querySelector('.central-col');

  // Si no hay sesión, al login
  if (!userId) {
    window.location.href = '/login';
    return;
  }

  // Formatear fecha
  const formatDate = (dateString) => {
    return new Date(dateString).toLocaleDateString('es-ES', {
      year: 'numeric', month: 'long', day: 'numeric'
    });
  };

  // Renderizar cada tarjeta de viaje
  const createTripCard = (trip) => {
    // Definir color según estado
    let statusColor = '#10b981'; // Verde (Finalizado)
    if (trip.co_estado === 'CANCELADO') statusColor = '#ef4444';
    if (trip.co_estado === 'PAGANDO' || trip.co_estado === 'FINANCIADO') statusColor = '#f59e0b';

    // Título del viaje
    const title = trip.co_es_paquete 
      ? `📦 Paquete: ${trip.nombre_paquete || 'Turístico'}` 
      : `✈️ Viaje Personalizado #${trip.co_cod}`;

    return `
      <div class="dashboard-card" style="margin-bottom: 1.5rem; border-left: 5px solid ${statusColor};">
          <div style="display: flex; justify-content: space-between; align-items: start;">
              <div>
                  <h3 style="margin-bottom: 0.5rem; font-size: 1.2rem;">${title}</h3>
                  <p style="color: #666; font-size: 0.9rem;">📅 Fecha de compra: ${formatDate(trip.co_fecha_hora)}</p>
                  <p style="margin-top: 0.5rem; font-weight: 500;">
                    Estado: <span style="color: ${statusColor};">${trip.co_estado}</span>
                  </p>
              </div>
              <div style="text-align: right;">
                  <div class="big-number" style="font-size: 1.5rem;">$${parseFloat(trip.co_monto_total).toFixed(2)}</div>
                  <div style="color: #2563eb; font-weight: 600; font-size: 0.9rem;">
                    +${trip.co_millas_a_agregar} Millas
                  </div>
              </div>
          </div>
          
          <div style="margin-top: 1.5rem; padding-top: 1rem; border-top: 1px solid #eee; display: flex; gap: 1rem;">
              <button class="btn-secondary" style="padding: 0.5rem 1rem; font-size: 0.85rem;">Ver Detalles</button>
              ${trip.co_estado === 'FINALIZADO' ? '<button class="btn-secondary" style="padding: 0.5rem 1rem; font-size: 0.85rem;">Descargar Factura</button>' : ''}
          </div>
      </div>
    `;
  };

  const loadHistory = async () => {
    // Mantener el header y limpiar el resto
    const header = container.querySelector('.dashboard-header');
    container.innerHTML = '';
    container.appendChild(header);

    // Loader
    const loader = document.createElement('p');
    loader.textContent = 'Cargando tus viajes...';
    container.appendChild(loader);

    try {
      const response = await fetch(`/api/sales/history?usuario_id=${userId}`);
      const payload = await response.json();

      loader.remove();

      if (!payload.ok) throw new Error(payload.message);

      const trips = payload.data;

      if (trips.length === 0) {
        container.insertAdjacentHTML('beforeend', `
            <div class="dashboard-card" style="text-align: center; padding: 3rem;">
                <p>Aún no has realizado ningún viaje.</p>
                <a href="/busqueda" class="cta-button" style="margin-top: 1rem; background: #000; display: inline-block;">¡Reserva el primero!</a>
            </div>
        `);
        return;
      }

      // Inyectar tarjetas
      trips.forEach(trip => {
        container.insertAdjacentHTML('beforeend', createTripCard(trip));
      });

    } catch (error) {
      console.error(error);
      loader.textContent = 'Error al cargar el historial.';
    }
  };

  document.addEventListener('DOMContentLoaded', loadHistory);
})();