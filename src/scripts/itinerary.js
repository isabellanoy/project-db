(() => {
  const listContainer = document.querySelector('section');
  const userId = localStorage.getItem('userId');

  if (!userId) {
    alert('Inicia sesión para ver tu itinerario');
    window.location.href = '/login';
    return;
  }

  const formatMoney = (amount) => {
    const val = parseFloat(amount || 0);
    return `$${val.toFixed(2)}`;
  };

  const renderItem = (item) => {
    let title, desc, price, details;
    const subtotal = parseFloat(item.res_costo_sub_total);

    switch(item.type) {
      case 'vuelo':
        title = `VUELO: ${item.v_cod_vue}`;
        desc = `${item.origen} &#8594; ${item.destino}`;
        details = `${item.bv_cant_pasajeros} Pasajeros`;
        break;
      case 'hotel':
        title = `HOTEL: ${item.nombre_hotel}`;
        desc = `Estadía de ${item.dh_cant_noches} noches`;
        details = `Check-in: ${new Date(item.dh_fecha_hora_check_in).toLocaleDateString()}`;
        break;
      case 'crucero':
        title = `CRUCERO: ${item.barco}`;
        desc = 'Viaje en alta mar';
        details = `${item.bvi_cant_pasajeros} Pasajeros`;
        break;
      case 'traslado':
        title = `TRASLADO`;
        desc = `Destino: ${item.destino}`;
        details = `Fecha: ${new Date(item.dt_fecha_hora).toLocaleDateString()}`;
        break;
      case 'actividad':
        title = `ACTIVIDAD: ${item.nombre_actividad}`;
        desc = 'Entrada Digital';
        details = `${item.ed_cant_personas} Personas`;
        break;
    }

    return `
      <article class="itinerary-item" style="padding: 1.5rem; border: 1px solid #000; margin-bottom: 1rem; background: #fff;">
          <div class="itinerary-item__header" style="display: flex; justify-content: space-between; border-bottom: 1px solid #eee; padding-bottom: 0.5rem; margin-bottom: 0.5rem;">
              <h2 style="font-size: 1.1rem; font-weight: 700;">${title}</h2>
              <div class="price-display">
                  <span class="main-price" style="font-weight: 700;">${formatMoney(subtotal)}</span>
              </div>
          </div>
          <p style="font-size: 1rem; margin-bottom: 0.25rem;">${desc}</p>
          <p class="hero__text" style="font-size: 0.85rem; color: #666;">${details}</p>
          <div style="margin-top: 1rem; text-align: right;">
             <button style="color: #ef4444; background: none; border: none; cursor: pointer; font-size: 0.9rem; text-decoration: underline;">Eliminar</button>
          </div>
      </article>
    `;
  };

  const loadItinerary = async () => {
    listContainer.innerHTML = '<p>Cargando itinerario...</p>';

    try {
      const response = await fetch(`/api/sales/itinerary?usuario_id=${userId}`);
      const payload = await response.json();

      if (!payload.ok) throw new Error(payload.message);

      const data = payload.data;

      if (!data || data.empty || data.items.length === 0) {
        listContainer.innerHTML = `
            <div style="text-align: center; padding: 3rem;">
                <h3>Tu itinerario está vacío</h3>
                <a href="/busqueda" class="cta-button" style="margin-top: 1rem; background: #000;">Explorar Servicios</a>
            </div>`;
        
        document.getElementById('totalAmount').textContent = '$0.00';
        document.getElementById('totalBs').textContent = 'Bs. 0,00';
        document.getElementById('totalMillas').textContent = '0';
        return;
      }

      listContainer.innerHTML = data.items.map(renderItem).join('');

      const total = parseFloat(data.info.co_monto_total);
      const millas = data.info.co_millas_a_agregar;
      const bsRate = 60; 

      document.getElementById('totalAmount').textContent = formatMoney(total);
      document.getElementById('totalBs').textContent = `Bs. ${(total * bsRate).toLocaleString('es-VE')}`;
      document.getElementById('totalMillas').textContent = millas;

    } catch (error) {
      console.error(error);
      listContainer.innerHTML = '<p style="color: red">Error cargando itinerario.</p>';
    }
  };

  document.addEventListener('DOMContentLoaded', loadItinerary);
})();