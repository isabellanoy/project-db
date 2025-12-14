(() => {
  const urlParams = new URLSearchParams(window.location.search);
  const serviceId = urlParams.get('id');
  const serviceType = urlParams.get('type');

  const contentContainer = document.querySelector('article');
  const statusMessage = document.createElement('div');
  statusMessage.style.cssText = "margin-top: 1rem; padding: 10px; border-radius: 5px; display: none; font-weight: 500;";
  contentContainer.appendChild(statusMessage);

  if (!serviceId || !serviceType) {
    contentContainer.innerHTML = '<p>Error: Servicio no especificado.</p>';
    return;
  }

  const loadDetail = async () => {
    try {
      const [rateRes, dataRes] = await Promise.all([
        fetch('/api/services/tasa'),
        fetch(`/api/services/catalog/${serviceType}/${serviceId}`)
      ]);

      const ratePayload = await rateRes.json();
      const dataPayload = await dataRes.json();
      const currentRate = ratePayload.ok ? ratePayload.data.tasa : 1;

      if (!dataPayload.ok) throw new Error(dataPayload.message);
      const item = dataPayload.data;

      // Renderizar datos básicos (Mapeo dinámico)
      document.getElementById('serviceTitle').textContent = 
        item.pt_nombre ? item.pt_nombre :
        item.codigo_vuelo ? `Vuelo ${item.codigo_vuelo}` :
        item.nombre_hotel ? `Hotel ${item.nombre_hotel}` :
        item.nombre_barco ? `Crucero ${item.nombre_barco}` :
        item.nombre_servicio || 'Servicio';

      const priceUsd = parseFloat(item.costo || item.pt_costo || 0);
      const priceBs = priceUsd * currentRate;

      document.getElementById('servicePrice').textContent = `$${priceUsd.toFixed(2)}`;
      document.getElementById('servicePriceBs').textContent = `Bs. ${priceBs.toLocaleString('es-VE', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;

      configureOptions(serviceType, item);

    } catch (error) {
      console.error(error);
      contentContainer.innerHTML = '<p>Error cargando la información.</p>';
    }
  };

  const configureOptions = (type, item) => {
    const optionsContainer = document.getElementById('dynamicOptions');
    optionsContainer.innerHTML = '';
    let html = '';

    if (type === 'vuelos') {
      html += `
        <div><label>Pasajeros:</label><input type="number" id="paxInput" value="1" min="1" class="form-input" style="width: 80px;"></div>
        <div><label>Clase:</label><select id="classInput" class="form-input"><option value="1">Economy Basic</option><option value="2">Economy Standard</option><option value="3">Business</option></select></div>`;
    } else if (type === 'alojamientos') {
      html += `
        <div><label>Noches:</label><input type="number" id="nightsInput" value="1" min="1" class="form-input" style="width: 80px;"></div>
        <div><label>Fecha Check-in:</label><input type="date" id="dateInput" class="form-input"></div>`;
    } else if (type === 'paquetes') {
      // Info especial para paquetes
      html += `
        <div style="background: #f0fdf4; padding: 1rem; border-radius: 5px; width: 100%;">
            <p style="color: #166534; font-weight: 600;">💎 Precio en Millas: ${item.pt_costo_millas}</p>
            <p style="font-size: 0.9rem;">Capacidad: ${item.pt_cant_personas} personas</p>
            <p style="font-size: 0.8rem; margin-top:0.5rem; color: #b91c1c;">Importante: Solo puede reservar un paquete si NO tiene una compra activa.</p>
        </div>`;
    }

    optionsContainer.innerHTML = html;
  };

  const handleAddToCart = async () => {
    const userId = localStorage.getItem('userId');
    
    if (!userId) {
      alert('Debes iniciar sesión para reservar.');
      window.location.href = '/login';
      return;
    }

    const btn = document.getElementById('addToCartBtn');
    btn.disabled = true;
    btn.textContent = 'Procesando...';
    statusMessage.style.display = 'none';

    let bodyData = { usuario_id: userId };
    let endpoint = '';

    // Mapeo de Endpoints y Datos
    if (serviceType === 'vuelos') {
        endpoint = '/api/sales/add/vuelo';
        bodyData.vuelo_id = serviceId;
        bodyData.pasajeros = document.getElementById('paxInput').value;
        bodyData.clase_id = document.getElementById('classInput').value;
    } else if (serviceType === 'alojamientos') {
        endpoint = '/api/sales/add/alojamiento';
        bodyData.habitacion_id = serviceId;
        bodyData.noches = document.getElementById('nightsInput').value;
        bodyData.check_in = document.getElementById('dateInput').value;
        if(!bodyData.check_in) { alert('Selecciona una fecha'); btn.disabled = false; return; }
    } else if (serviceType === 'paquetes') {
        endpoint = '/api/sales/add/paquete';
        bodyData.paquete_id = serviceId;
    }
    // ... añadir lógica para otros tipos si es necesario

    try {
      const response = await fetch(endpoint, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(bodyData)
      });

      const result = await response.json();

      if (result.ok) {
        statusMessage.textContent = '¡Procesado correctamente!';
        statusMessage.style.backgroundColor = '#dcfce7';
        statusMessage.style.color = '#166534';
        statusMessage.style.display = 'block';
        
        setTimeout(() => {
            if(serviceType === 'paquetes') window.location.href = '/checkout'; // Paquetes van directo a pagar
            else window.location.href = '/itinerario';
        }, 1500);
      } else {
        throw new Error(result.message);
      }

    } catch (error) {
      statusMessage.textContent = `Error: ${error.message}`;
      statusMessage.style.backgroundColor = '#fee2e2';
      statusMessage.style.color = '#991b1b';
      statusMessage.style.display = 'block';
    } finally {
      btn.disabled = false;
      btn.textContent = serviceType === 'paquetes' ? 'Reservar Paquete' : 'Agregar al Itinerario';
    }
  };

  document.addEventListener('DOMContentLoaded', () => {
    loadDetail();
    const addBtn = document.getElementById('addToCartBtn');
    if(addBtn) addBtn.addEventListener('click', handleAddToCart);
  });
})();