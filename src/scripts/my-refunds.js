document.addEventListener('DOMContentLoaded', async () => {
    const userId = localStorage.getItem('userId');

    if (!userId) {
        window.location.href = '/login';
        return;
    }

    try {
        const response = await fetch(`/api/user/refunds?usuario_cod=${userId}`, {
            headers: { 'x-user-id': userId }
        });

        if (!response.ok) {
            throw new Error('Error al obtener los reembolsos');
        }

        const { data: refunds } = await response.json();
        const refundsBody = document.getElementById('refunds-body');

        if (refunds.length === 0) {
            refundsBody.innerHTML = '<tr><td colspan="5" style="text-align:center;">No has solicitado ningún reembolso.</td></tr>';
            return;
        }

        refundsBody.innerHTML = refunds.map(refund => `
            <tr>
                <td>${refund.cod}</td>
                <td>${refund.monto_devuelto}</td>
                <td>${new Date(refund.fecha_reembolso).toLocaleDateString()}</td>
                <td>${refund.razon}</td>
                <td>${refund.tipo_servicio}</td>
            </tr>
        `).join('');

    } catch (error) {
        console.error('Error:', error);
        const refundsBody = document.getElementById('refunds-body');
        refundsBody.innerHTML = `<tr><td colspan="5" style="text-align:center;">${error.message}</td></tr>`;
    }
});
