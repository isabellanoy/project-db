(() => {
  const cardsContainer = document.getElementById('cardsContainer');
  const resultsCountLabel = document.getElementById('resultsCount');
  
  const typeRadios = document.querySelectorAll('input[name="type"]');
  const mainSearchBtn = document.getElementById('mainSearchBtn');
  const searchTypeSelect = document.getElementById('searchType');

  let currentRate = 1;

  const formatDate = (dateString) => {
    if (!dateString) return 'Por confirmar';
    const date = new Date(dateString);
    return date.toLocaleDateString('es-ES', { 
      day: '2-digit', month: '2-digit', year: 'numeric', 
      hour: '2-digit', minute:'2-digit' 
    });
  };

  const createCard = (item, type) => {
    let title, description, details, icon;
    
    switch(type) {
      case 'vuelos':
        title = `Vuelo ${item.codigo_vuelo}`;
        icon = '✈️';
        description = `📍 ${item.origen} &#8594; ${item.destino}`;
        details = `🕒 Salida: ${formatDate(item.fecha_salida)} | Duración: ${item.duracion_horas}h`;
        break;
      case 'alojamientos':
        title = `Hotel ${item.nombre_hotel}`;
        icon = '🏨';
        description = `📍 ${item.lugar} - ${item.tipo_habitacion} (${item.numero_habitacion})`;
        details = `👥 Capacidad: ${item.capacidad} personas`;
        break;
      case 'viajes':
        title = `Crucero: ${item.nombre_barco}`;
        icon = '🚢';
        description = `📍 Salida: ${item.origen} &#8594; Llegada: ${item.destino}`;
        details = `🕒 Salida: ${formatDate(item.fecha_salida)} | ${item.duracion_dias} días`;
        break;
      case 'traslados':
        title = `Traslado Terrestre`;
        icon = '🚕';
        description = `📍 Destino: ${item.lugar_llegada}`;
        details = `Salida desde: ${item.direccion_terminal_salida}`;
        break;
      case 'actividades':
        title = item.nombre_servicio;
        icon = '🎟️';
        description = `📍 Lugar: ${item.lugar}`;
        details = `👥 Capacidad: ${item.capacidad} personas`;
        break;
      default:
        title = 'Servicio';
        icon = '🏷️';
        description = 'Sin descripción';
        details = '';
    }

    const priceUsd = parseFloat(item.costo || 0);
    const priceBs = priceUsd * currentRate;

    const detailLink = `/detalle?id=${item.cod_servicio}&type=${type}`;

    return `
      <article class="result-card">
          <div>
              <div class="result-card__header">
                  <h2 style="font-size: 1.4rem; border-bottom: 1px solid #000; padding-bottom: 5px; display: inline-block;">
                      ${icon} ${title}
                  </h2>
              </div>
              <p style="font-size: 1.1rem; margin: 0.5rem 0;">${description}</p>
              <p class="hero__text" style="font-size: 0.95rem;">${details}</p>
              
              <div style="margin-top: 1rem;">
                  <span style="font-size: 1.5rem; font-weight: 600;">$${priceUsd.toFixed(2)}</span>
                  <span style="font-size: 0.8rem; color: #666; display: block;">Aprox. Bs. ${priceBs.toLocaleString('es-VE', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}</span>
                  <span style="font-size: 0.8rem; color: #2563eb; font-weight: 600;">+ ${item.millas || 0} Millas</span>
              </div>
          </div>
          <div style="display: flex; align-items: flex-end; gap: 10px;">
              <a href="${detailLink}" class="cta-button" style="background: #000; border-radius: 0;">Ver Detalle</a>
          </div>
      </article>
    `;
  };

  const loadResults = async () => {
    const urlParams = new URLSearchParams(window.location.search);
    const type = urlParams.get('type') || 'vuelos';

    if (typeRadios) typeRadios.forEach(r => r.checked = (r.value === type));
    if (searchTypeSelect) searchTypeSelect.value = type;

    if(resultsCountLabel) resultsCountLabel.textContent = 'Buscando servicios...';
    if(cardsContainer) cardsContainer.innerHTML = ''; 

    try {
      // 1. Obtener Tasa y Datos en paralelo
      const [rateRes, dataRes] = await Promise.all([
        fetch('/api/services/tasa'),
        fetch(`/api/services/catalog/${type}`)
      ]);

      const ratePayload = await rateRes.json();
      const dataPayload = await dataRes.json();

      // Guardar tasa globalmente
      if (ratePayload.ok) currentRate = ratePayload.data.tasa;

      if (!dataPayload.ok) throw new Error(dataPayload.message);
      const data = dataPayload.data;

      if(resultsCountLabel) resultsCountLabel.textContent = `${data.length} resultados encontrados`;
      
      if (data.length === 0) {
        cardsContainer.innerHTML = `
            <div style="padding: 3rem; text-align: center; width: 100%; grid-column: 1/-1;">
                <p style="font-size: 1.2rem; color: #666;">No hay servicios disponibles en esta categoría actualmente.</p>
            </div>`;
      } else {
        cardsContainer.innerHTML = data.map(item => createCard(item, type)).join('');
      }

    } catch (error) {
      console.error(error);
      if(resultsCountLabel) resultsCountLabel.textContent = 'Error';
      if(cardsContainer) cardsContainer.innerHTML = `<p style="color: red; padding: 1rem;">Error de conexión.</p>`;
    }
  };

  if (typeRadios) {
      typeRadios.forEach(radio => {
          radio.addEventListener('change', (e) => {
              window.location.href = `/busqueda?type=${e.target.value}`;
          });
      });
  }

  if (mainSearchBtn) {
      mainSearchBtn.addEventListener('click', () => {
          window.location.href = `/busqueda?type=${searchTypeSelect.value}`;
      });
  }

  document.addEventListener('DOMContentLoaded', () => {
    if (window.location.pathname.includes('/busqueda')) {
        loadResults();
    }
  });
})();