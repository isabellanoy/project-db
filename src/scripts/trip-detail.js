(() => {
    const urlParams = new URLSearchParams(window.location.search);
    const compraId = urlParams.get('id');
    const userId = localStorage.getItem('userId');
    const container = document.getElementById('servicesContainer');
    
    // Modal elements
    const modal = document.getElementById('actionModal');
    const modalTitle = document.getElementById('modalTitle');
    const modalFields = document.getElementById('modalFields');
    const actionForm = document.getElementById('actionForm');
    const inputAction = document.getElementById('modalActionType');
    const inputService = document.getElementById('modalServiceId');

    if(!compraId || !userId) {
        window.location.href = '/mis-viajes';
        return;
    }

    // 1. Cargar Servicios
    const loadServices = async () => {
        try {
            const res = await fetch(`/api/interactions/details/${compraId}`);
            const json = await res.json();

            if(!json.ok || json.data.length === 0) {
                container.innerHTML = '<p>No se encontraron servicios o la compra no existe.</p>';
                return;
            }

            container.innerHTML = json.data.map(item => `
                <div class="service-card">
                    <div style="display:flex; justify-content:space-between;">
                        <h3>${item.descripcion} <span style="font-size:0.8rem; color:#666">(${item.tipo_servicio})</span></h3>
                        ${item.es_paquete ? '<span class="badge badge-pkg">Paquete</span>' : ''}
                    </div>
                    <p>${item.detalle_1 || ''}</p>
                    <p>${item.detalle_2 || ''}</p>
                    
                    <div class="service-actions">
                        ${!item.es_paquete ? `
                            <button onclick="openAction('refund', ${item.servicio_cod})" class="btn-danger" style="font-size:0.85rem; padding:0.4rem 0.8rem;">Solicitar Reembolso</button>
                        ` : ''}
                        
                        <button onclick="openAction('complaint', ${item.servicio_cod})" class="btn-secondary" style="font-size:0.85rem; padding:0.4rem 0.8rem;">Abrir Reclamo</button>
                        
                        <button onclick="openAction('review', ${item.servicio_cod})" class="btn-primary" style="font-size:0.85rem; padding:0.4rem 0.8rem;">Dejar Reseña</button>
                    </div>
                </div>
            `).join('');

        } catch (error) {
            console.error(error);
            container.innerHTML = '<p style="color:red">Error de conexión.</p>';
        }
    };

    // 2. Manejo de Modales
    window.openAction = (action, serviceId) => {
        inputAction.value = action;
        inputService.value = serviceId;
        modal.classList.add('active');
        
        // Configurar contenido según acción
        if (action === 'refund') {
            modalTitle.textContent = 'Solicitar Reembolso';
            modalFields.innerHTML = `
                <label>Razón del reembolso</label>
                <textarea name="razon" class="form-input" required placeholder="Explique el motivo..."></textarea>
                <p style="font-size:0.8rem; color:red; margin-top:5px;">Aplica penalización del 10%.</p>
            `;
        } else if (action === 'complaint') {
            modalTitle.textContent = 'Presentar Queja';
            modalFields.innerHTML = `
                <label>Descripción del problema</label>
                <textarea name="descripcion" class="form-input" required></textarea>
            `;
        } else if (action === 'review') {
            modalTitle.textContent = 'Calificar Servicio';
            modalFields.innerHTML = `
                <label>Puntuación (1-10)</label>
                <input type="number" name="calificacion" class="form-input" min="1" max="10" required>
                <label style="margin-top:10px;">Comentario</label>
                <textarea name="comentario" class="form-input" required></textarea>
            `;
        }
    };

    window.closeModal = () => modal.classList.remove('active');

    // 3. Enviar Formulario
    actionForm.addEventListener('submit', async (e) => {
        e.preventDefault();
        const action = inputAction.value;
        const formData = new FormData(actionForm);
        const data = Object.fromEntries(formData.entries());
        
        // Datos base
        const payload = {
            usuario_id: userId,
            compra_id: compraId,
            servicio_id: inputService.value,
            ...data
        };

        const endpoint = `/api/interactions/${action}`; // refund, complaint, review

        try {
            const res = await fetch(endpoint, {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(payload)
            });
            const json = await res.json();

            if (json.ok) {
                alert(json.message);
                closeModal();
            } else {
                alert('Error: ' + json.message);
            }
        } catch (error) {
            alert('Error de conexión');
        }
    });

    loadServices();
})();