document.addEventListener('DOMContentLoaded', async () => {
    const userId = localStorage.getItem('userId');

    if (!userId) {
        window.location.href = '/login';
        return;
    }

    try {
        const response = await fetch(`/api/user/complaints?usuario_cod=${userId}`, {
            headers: { 'x-user-id': userId }
        });

        if (!response.ok) {
            throw new Error('Error al obtener las quejas');
        }

        const { data: complaints } = await response.json();
        const complaintsBody = document.getElementById('complaints-body');

        if (complaints.length === 0) {
            complaintsBody.innerHTML = '<tr><td colspan="4" style="text-align:center;">No has realizado ninguna queja.</td></tr>';
            return;
        }

        complaintsBody.innerHTML = complaints.map(complaint => `
            <tr>
                <td>${complaint.cod}</td>
                <td>${complaint.descripcion}</td>
                <td>${complaint.resuelta ? 'Sí' : 'No'}</td>
                <td>${complaint.tipo_servicio}</td>
            </tr>
        `).join('');

    } catch (error) {
        console.error('Error:', error);
        const complaintsBody = document.getElementById('complaints-body');
        complaintsBody.innerHTML = `<tr><td colspan="4" style="text-align:center;">${error.message}</td></tr>`;
    }
});
