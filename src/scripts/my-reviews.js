document.addEventListener('DOMContentLoaded', async () => {
    const userId = localStorage.getItem('userId');

    if (!userId) {
        window.location.href = '/login';
        return;
    }

    try {
        const response = await fetch(`/api/user/reviews?usuario_cod=${userId}`, {
            headers: { 'x-user-id': userId }
        });

        if (!response.ok) {
            throw new Error('Error al obtener las reseñas');
        }

        const { data: reviews } = await response.json();
        const reviewsBody = document.getElementById('reviews-body');

        if (reviews.length === 0) {
            reviewsBody.innerHTML = '<tr><td colspan="4" style="text-align:center;">No has realizado ninguna reseña.</td></tr>';
            return;
        }

        reviewsBody.innerHTML = reviews.map(review => `
            <tr>
                <td>${review.cod}</td>
                <td>${review.calificacion}</td>
                <td>${review.comentario}</td>
                <td>${review.tipo_servicio}</td>
            </tr>
        `).join('');

    } catch (error) {
        console.error('Error:', error);
        const reviewsBody = document.getElementById('reviews-body');
        reviewsBody.innerHTML = `<tr><td colspan="4" style="text-align:center;">${error.message}</td></tr>`;
    }
});
