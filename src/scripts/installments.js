(() => {
    const userId = localStorage.getItem('userId');
    const tbody = document.getElementById('cuotasBody');
    const modal = document.getElementById('paymentModal');
    const form = document.getElementById('paymentForm');
    const bankSelect = document.getElementById('bankSelect');

    if (!userId) {
        window.location.href = '/login';
        return;
    }

    // 1. Cargar Bancos (para el modal)
    const loadBanks = async () => {
        try {
            const res = await fetch('/api/banks');
            const json = await res.json();
            if (json.ok) {
                bankSelect.innerHTML = '<option value="">Banco...</option>' + 
                    json.data.map(b => `<option value="${b.ba_cod}">${b.ba_nombre}</option>`).join('');
            }
        } catch (e) { console.error(e); }
    };

    // 2. Cargar Cuotas
    const loadInstallments = async () => {
        tbody.innerHTML = '<tr><td colspan="7" style="text-align:center;">Cargando...</td></tr>';
        
        try {
            const res = await fetch(`/api/installments/${userId}`);
            const json = await res.json();

            if (!json.ok || !json.data || json.data.length === 0 || json.data[0].cod_cuota === null) {
                tbody.innerHTML = '<tr><td colspan="7" style="text-align:center;">No tienes cuotas pendientes de pago.</td></tr>';
                return;
            }

            // Filtrar solo las de compras que NO estén finalizadas (PAGANDO o FINANCIADO)
            const activeQuotas = json.data.filter(q => q.estado_compra !== 'FINALIZADO');

            if (activeQuotas.length === 0) {
                tbody.innerHTML = '<tr><td colspan="7" style="text-align:center;">Estás al día. No hay cuotas pendientes.</td></tr>';
                return;
            }

            tbody.innerHTML = activeQuotas.map(q => {
                const montoBase = parseFloat(q.monto_cuota);
                const recargo = parseFloat(q.monto_recargo || 0);
                const total = montoBase + recargo;
                const fecha = new Date(q.fecha_final_cuota).toLocaleDateString();

                const paymentButton = total > 0 ? `
                            <button onclick="openPaymentModal(${q.cod_cuota}, ${total})" class="cta-button" style="background:#000; font-size:0.8rem; padding:0.4rem 0.8rem;">
                                Pagar
                            </button>
                        ` : '';

                return `
                    <tr>
                        <td>#${q.cod_cuota}</td>
                        <td>${fecha}</td>
                        <td><span style="font-weight:bold; color:#f59e0b;">${q.estado_compra}</span></td>
                        <td>Bs. ${montoBase.toFixed(2)}</td>
                        <td style="color:red;">${recargo > 0 ? `+ Bs. ${recargo.toFixed(2)}` : '-'}</td>
                        <td style="font-weight:bold;">Bs. ${total.toFixed(2)}</td>
                        <td>
                            ${paymentButton}
                        </td>
                    </tr>
                `;
            }).join('');

        } catch (error) {
            console.error(error);
            tbody.innerHTML = '<tr><td colspan="7" style="color:red; text-align:center;">Error de conexión.</td></tr>';
        }
    };

    // 3. Lógica del Modal
    window.openPaymentModal = (id, amount) => {
        document.getElementById('modalQuotaId').textContent = id;
        document.getElementById('modalAmountDisplay').textContent = `Bs. ${amount.toFixed(2)}`;
        document.getElementById('inputQuotaId').value = id;
        document.getElementById('inputAmount').value = amount;
        
        modal.classList.add('active');
    };

    window.closePaymentModal = () => modal.classList.remove('active');

    window.toggleMethodFields = () => {
        const method = document.getElementById('methodSelect').value;
        document.getElementById('cardFields').style.display = method === 'card' ? 'block' : 'none';
        document.getElementById('digitalFields').style.display = method === 'digital' ? 'block' : 'none';
    };

    // 4. Procesar Pago
    form.addEventListener('submit', async (e) => {
        e.preventDefault();
        const formData = new FormData(form);
        const data = Object.fromEntries(formData.entries());
        const method = document.getElementById('methodSelect').value;

        // Separar los detalles de pago del resto de los datos
        let paymentDetails = {};
        if (method === 'card') {
            paymentDetails = {
                numero: data.numero,
                cvc: data.cvc,
                titular: data.titular,
                vencimiento: data.vencimiento,
                banco_id: data.banco_id,
                emisor: data.emisor,
            };
        } else { // 'digital'
            paymentDetails = {
                referencia: data.referencia,
            };
        }
        
        // Construir el payload final
        const payload = {
            usuario_id: userId,
            cuota_id: parseInt(document.getElementById('inputQuotaId').value, 10),
            monto: parseFloat(document.getElementById('inputAmount').value),
            ...paymentDetails
        };

        const endpoint = method === 'card' ? '/api/installments/pay/card' : '/api/installments/pay/digital';

        try {
            const res = await fetch(endpoint, {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(payload)
            });
            const json = await res.json();

            if (json.ok) {
                alert('¡Pago realizado con éxito!');
                window.location.reload();
            } else {
                alert('Error: ' + json.message);
            }
        } catch (error) {
            alert('Error de conexión');
        }
    });

    // Iniciar
    loadBanks();
    loadInstallments();
})();