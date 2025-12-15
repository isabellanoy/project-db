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

  let basePriceUsd = 0;
  let exchangeRate = 1;

  const loadDetail = async () => {
    try {
      const [rateRes, dataRes] = await Promise.all([
        fetch('/api/services/tasa'),
        fetch(`/api/services/catalog/${serviceType}/${serviceId}`)
      ]);

      const ratePayload = await rateRes.json();
      const dataPayload = await dataRes.json();
      exchangeRate = ratePayload.ok ? ratePayload.data.tasa : 1;

      if (!dataPayload.ok) throw new Error(dataPayload.message);
      const item = dataPayload.data;

      document.getElementById('serviceTitle').textContent = 
        item.pt_nombre ? item.pt_nombre :
        item.codigo_vuelo ? `Vuelo ${item.codigo_vuelo}` :
        item.nombre_hotel ? `Hotel ${item.nombre_hotel}` :
        item.nombre_barco ? `Crucero ${item.nombre_barco}` :
        item.nombre_servicio || 'Servicio';

      basePriceUsd = parseFloat(item.costo || item.pt_costo || 0);
      updatePriceDisplay(basePriceUsd);

      configureOptions(serviceType, item);

    } catch (error) {
      console.error(error);
      contentContainer.innerHTML = '<p>Error cargando la información.</p>';
    }
  };

  const updatePriceDisplay = (priceUsd) => {
    const priceBs = priceUsd * exchangeRate;
    document.getElementById('servicePrice').textContent = `$${priceUsd.toFixed(2)}`;
    document.getElementById('servicePriceBs').textContent = `Bs. ${priceBs.toLocaleString('es-VE', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
  };

  const configureOptions = async (type, item) => {
    const optionsContainer = document.getElementById('dynamicOptions');
    optionsContainer.innerHTML = '';
    let html = '';

    if (type === 'vuelos') {
      html += `
        <div><label>Pasajeros:</label><input type="number" id="paxInput" value="1" min="1" class="form-input" style="width: 80px;"></div>
        <div><label>Clase:</label><select id="classInput" class="form-input"><option>Cargando clases...</option></select></div>`;
      optionsContainer.innerHTML = html;

      try {
        const classesRes = await fetch(`/api/services/catalog/vuelos/${serviceId}/clases`);
        const classesPayload = await classesRes.json();
        
        if (classesPayload.ok) {
          const classSelect = document.getElementById('classInput');
          classSelect.innerHTML = '';
          classesPayload.data.forEach(cls => {
            const option = document.createElement('option');
            option.value = cls.cod_clase;
            option.textContent = `${cls.nombre} (+${cls.costo} USD)`;
            option.dataset.additionalCost = cls.costo;
            classSelect.appendChild(option);
          });
          
          const updateFlightPrice = () => {
            const selectedClass = classSelect.options[classSelect.selectedIndex];
            const additionalCost = parseFloat(selectedClass.dataset.additionalCost || 0);
            const totalPrice = basePriceUsd + additionalCost;
            updatePriceDisplay(totalPrice);
          };

          classSelect.addEventListener('change', updateFlightPrice);
          updateFlightPrice(); // Update price with default selected class
        } else {
          document.getElementById('classInput').innerHTML = '<option value="">No se cargaron las clases</option>';
        }
      } catch (error) {
        console.error('Error fetching classes:', error);
        document.getElementById('classInput').innerHTML = '<option value="">Error al cargar</option>';
      }

    } else if (type === 'alojamientos') {
      html += `
        <div><label>Noches:</label><input type="number" id="nightsInput" value="1" min="1" class="form-input" style="width: 80px;"></div>
        <div><label>Fecha Check-in:</label><input type="date" id="dateInput" class="form-input"></div>`;
      optionsContainer.innerHTML = html;
    } else if (type === 'paquetes') {
      html += `
        <div style="background: #f0fdf4; padding: 1rem; border-radius: 5px; width: 100%;">
            <p style="color: #166534; font-weight: 600;"> Precio en Millas: ${item.pt_costo_millas}</p>
            <p style="font-size: 0.9rem;">Capacidad: ${item.pt_cant_personas} personas</p>
            <p style="font-size: 0.8rem; margin-top:0.5rem; color: #b91c1c;">Importante: Solo puede reservar un paquete si NO tiene una compra activa.</p>
        </div>`;
      optionsContainer.innerHTML = html;
    } else if (type === 'viajes') {
        html = `
            <div><label>Pasajeros:</label><input type="number" id="paxInput" value="1" min="1" class="form-input" style="width: 80px;"></div>
            <div><label>Camarote:</label><select id="cabinInput" class="form-input"><option>Cargando...</option></select></div>
            <div id="extraServicesContainer">
                <label>Servicios Adicionales:</label>
                <div id="servicesRadioButtons"><p>Cargando...</p></div>
            </div>
        `;
        optionsContainer.innerHTML = html;

        const [cabinsRes, servicesRes] = await Promise.all([
            fetch(`/api/services/catalog/viajes/${serviceId}/camarotes`),
            fetch(`/api/services/catalog/viajes/${serviceId}/servicios`)
        ]);

        const cabinsPayload = await cabinsRes.json();
        const servicesPayload = await servicesRes.json();

        const paxInput = document.getElementById('paxInput');
        const cabinSelect = document.getElementById('cabinInput');
        const servicesRadioButtons = document.getElementById('servicesRadioButtons');

        // Camarotes
        cabinSelect.innerHTML = '';
        if (cabinsPayload.ok && cabinsPayload.data.length > 0) {
            cabinsPayload.data.forEach(cabin => {
                const option = document.createElement('option');
                option.value = cabin.cod_camarote;
                option.textContent = `${cabin.nombre} (${cabin.capacidad}p) (+${cabin.costo} USD)`;
                option.dataset.cost = cabin.costo;
                option.dataset.capacity = cabin.capacidad;
                cabinSelect.appendChild(option);
            });
        } else {
            cabinSelect.innerHTML = '<option value="">No hay camarotes disponibles</option>';
            const addBtn = document.getElementById('addToCartBtn');
            if (addBtn) {
                addBtn.disabled = true;
                addBtn.textContent = 'No Disponible';
            }
        }

        // Servicios extra
        servicesRadioButtons.innerHTML = '';
        if (servicesPayload.ok) {
            // Add a "No additional service" option
            const noServiceLabel = document.createElement('label');
            noServiceLabel.htmlFor = 'service-none';
            noServiceLabel.style.cssText = "display: flex; align-items: center; gap: 0.5rem; font-weight: 400;";
            const noServiceRadio = document.createElement('input');
            noServiceRadio.type = 'radio';
            noServiceRadio.id = 'service-none';
            noServiceRadio.name = 'cruiseServiceSelection';
            noServiceRadio.value = ''; // No service selected
            noServiceRadio.dataset.cost = 0;
            noServiceRadio.checked = true; // Default selected
            noServiceLabel.appendChild(noServiceRadio);
            noServiceLabel.appendChild(document.createTextNode('Ningún servicio adicional'));
            servicesRadioButtons.appendChild(noServiceLabel);

            servicesPayload.data.forEach(service => {
                const radioId = `service-${service.cod_servicio}`;
                const label = document.createElement('label');
                label.htmlFor = radioId;
                label.style.cssText = "display: flex; align-items: center; gap: 0.5rem; font-weight: 400;"

                const radio = document.createElement('input');
                radio.type = 'radio';
                radio.id = radioId;
                radio.name = 'cruiseServiceSelection'; // Group radio buttons
                radio.value = service.cod_servicio;
                radio.dataset.cost = service.costo;
                
                label.appendChild(radio);
                label.appendChild(document.createTextNode(`${service.descripcion} (+${service.costo} USD)`));
                servicesRadioButtons.appendChild(label);
            });
        } else {
            servicesRadioButtons.innerHTML = '<p>No hay servicios extra.</p>';
        }

        const updateCruisePrice = () => {
            const pax = parseInt(paxInput.value) || 1;

            const selectedCabin = cabinSelect.options[cabinSelect.selectedIndex];
            const cabinCost = parseFloat(selectedCabin.dataset.cost || 0);

            let extraServicesCost = 0;
            const selectedServiceRadio = document.querySelector('input[name="cruiseServiceSelection"]:checked');
            if (selectedServiceRadio) {
                extraServicesCost = parseFloat(selectedServiceRadio.dataset.cost || 0);
            }

            // Calculo precio
            const totalPrice = (basePriceUsd * pax) + cabinCost + extraServicesCost;
            updatePriceDisplay(totalPrice);
        };

        [paxInput, cabinSelect].forEach(el => el.addEventListener('change', updateCruisePrice));
        servicesRadioButtons.addEventListener('change', updateCruisePrice);

        updateCruisePrice(); // Initial price calculation
    } else if (type === 'traslados') {
        html = `
            <div><label>Fecha:</label><input type="date" id="dateInput" class="form-input"></div>
            <div><label>Vehículo:</label><select id="vehicleInput" class="form-input"><option>Cargando vehículos...</option></select></div>
        `;
        optionsContainer.innerHTML = html;

        try {
            const vehiclesRes = await fetch(`/api/services/catalog/traslados/${serviceId}/vehiculos`);
            const vehiclesPayload = await vehiclesRes.json();

            const vehicleSelect = document.getElementById('vehicleInput');
            vehicleSelect.innerHTML = '';
            if (vehiclesPayload.ok) {
                vehiclesPayload.data.forEach(vehicle => {
                    const option = document.createElement('option');
                    option.value = vehicle.cod_vehiculo;
                    option.textContent = `${vehicle.marca} ${vehicle.modelo} (${vehicle.capacidad}p) ($${vehicle.costo_por_km} USD/km)`;
                    option.dataset.costPerKm = vehicle.costo_por_km;
                    vehicleSelect.appendChild(option);
                });
            } else {
                vehicleSelect.innerHTML = '<option value="">No hay vehículos</option>';
            }

            const dateInput = document.getElementById('dateInput');
            const updateTrasladoOptions = () => {
                const addBtn = document.getElementById('addToCartBtn');
                if (addBtn) { // Check if addBtn exists
                    addBtn.disabled = !dateInput.value || !vehicleSelect.value;
                }
            };

            dateInput.addEventListener('change', updateTrasladoOptions);
            vehicleSelect.addEventListener('change', updateTrasladoOptions);
            updateTrasladoOptions(); // Initial check
        } catch (error) {
            console.error('Error fetching vehicles:', error);
            document.getElementById('vehicleInput').innerHTML = '<option value="">Error al cargar</option>';
        }
    } else if (type === 'actividades') {
        html = `
            <div><label>Personas:</label><input type="number" id="paxInput" value="1" min="1" class="form-input" style="width: 80px;"></div>
        `;
        optionsContainer.innerHTML = html;
    }
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
        endpoint = '/api/add/vuelo';
        bodyData.vuelo_id = serviceId;
        bodyData.pasajeros = document.getElementById('paxInput').value;
        bodyData.clase_id = document.getElementById('classInput').value;
    } else if (serviceType === 'alojamientos') {
        endpoint = '/api/add/alojamiento';
        bodyData.habitacion_id = serviceId;
        bodyData.noches = document.getElementById('nightsInput').value;
        bodyData.check_in = document.getElementById('dateInput').value;
        if(!bodyData.check_in) { alert('Selecciona una fecha'); btn.disabled = false; return; }
    } else if (serviceType === 'paquetes') {
        endpoint = '/api/add/paquete';
        bodyData.paquete_id = serviceId;
    } else if (serviceType === 'viajes') {
        endpoint = '/api/add/viaje';
        bodyData.viaje_id = serviceId;
        bodyData.pasajeros = document.getElementById('paxInput').value;
        bodyData.camarote_id = document.getElementById('cabinInput').value;
        const selectedServiceRadio = document.querySelector('input[name="cruiseServiceSelection"]:checked');
        if (selectedServiceRadio && selectedServiceRadio.value) {
            bodyData.servicio_barco_sb_cod = selectedServiceRadio.value;
        }
    } else if (serviceType === 'traslados') {
        endpoint = '/api/add/traslado';
        bodyData.traslado_id = serviceId;
        bodyData.automovil_id = document.getElementById('vehicleInput').value;
        bodyData.fecha = document.getElementById('dateInput').value;
        if(!bodyData.fecha) { alert('Selecciona una fecha'); btn.disabled = false; return; }
    } else if (serviceType === 'actividades') {
        endpoint = '/api/add/actividad';
        bodyData.actividad_id = serviceId;
        bodyData.personas = document.getElementById('paxInput').value;
    }

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