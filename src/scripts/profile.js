(() => {
  const userId = localStorage.getItem('userId');

  // Validación de seguridad
  if (!userId) {
    window.location.href = '/login';
    return;
  }

  // Elementos del DOM
  const elements = {
    headerName: document.querySelector('.sidebar__title h3'),
    welcomeTitle: document.querySelector('.dashboard-header h1'),
    milesDisplay: document.querySelector('.big-number'),
    inputName: document.querySelector('input[name="fullname"]'),
    inputEmail: document.querySelector('input[type="email"]'),
    inputId: document.querySelector('input[name="ci"]'),
    logoutBtn: document.getElementById('logoutBtn')
  };

  const loadProfile = async () => {
    try {
      const response = await fetch(`/api/auth/me?usuario_cod=${userId}`);
      const payload = await response.json();

      if (!payload.ok) throw new Error(payload.message);

      const data = payload.data;

      if(elements.headerName) elements.headerName.textContent = `Panel ${data.nombre_corto}`;

      if(elements.milesDisplay) {
        elements.milesDisplay.textContent = `${data.millas} millas`;
      }

      if(elements.inputName) elements.inputName.value = data.nombre;
      if(elements.inputEmail) elements.inputEmail.value = data.correo;
      if(elements.inputId) elements.inputId.value = data.ci;

    } catch (error) {
      console.error(error);
      alert('Error cargando perfil. Por favor inicia sesión nuevamente.');
    }
  };

  const logout = () => {
    localStorage.clear();
    window.location.href = '/login';
  };

  document.addEventListener('DOMContentLoaded', () => {
    loadProfile();
    
    const logoutButtons = document.querySelectorAll('a[href*="login"], #logoutBtn');
    logoutButtons.forEach(btn => {
      btn.addEventListener('click', (e) => {
        e.preventDefault();
        logout();
      });
    });
  });


  window.loadWishes = async (type) => {
      const userId = localStorage.getItem('userId');
      const container = document.getElementById('wishlistContainer');
      
      // UI Activa
      document.getElementById('btnWishServices').style.background = type === 'services' ? '#000' : '#fff';
      document.getElementById('btnWishServices').style.color = type === 'services' ? '#fff' : '#000';
      document.getElementById('btnWishPackages').style.background = type === 'packages' ? '#000' : '#fff';
      document.getElementById('btnWishPackages').style.color = type === 'packages' ? '#fff' : '#000';

      container.innerHTML = '<p>Cargando...</p>';

      try {
          const res = await fetch(`/api/wishlist/${type}/${userId}`);
          const json = await res.json();

          if (!json.ok || json.data.length === 0) {
              container.innerHTML = '<p style="color:#666;">No tienes items guardados en esta lista.</p>';
              return;
          }

          container.innerHTML = json.data.map(item => {
              // Mapeo dinámico según si es paquete o servicio
              const id = type === 'packages' ? item.id_paquete : item.id_servicio;
              const title = item.nombre;
              const desc = item.descripcion || (item.tipo_servicio + ' - ' + item.proveedor);
              const price = item.costo ? `$${item.costo}` : 'Consultar';
              const detailLink = type === 'packages' 
                  ? `/detalle?type=paquetes&id=${id}` 
                  : `/detalle?type=${getServiceTypeUrl(item.tipo_servicio)}&id=${id}`;

              return `
                  <div style="border: 1px solid #ddd; padding: 1rem; border-radius: 8px; display: flex; justify-content: space-between; align-items: center; background: #fff;">
                      <div>
                          <h4 style="margin: 0; font-weight: 700;">${title}</h4>
                          <p style="font-size: 0.85rem; color: #555; margin: 0.25rem 0;">${desc}</p>
                          <strong style="color: #2563eb;">${price}</strong>
                      </div>
                      <div style="display: flex; gap: 0.5rem;">
                          <a href="${detailLink}" class="btn-secondary" style="font-size: 0.8rem; padding: 0.4rem;">Ver</a>
                          <button onclick="removeFromWishlist(${id}, '${type}')" class="btn-danger" style="font-size: 0.8rem; padding: 0.4rem;">🗑️</button>
                      </div>
                  </div>
              `;
          }).join('');

      } catch (error) {
          console.error(error);
          container.innerHTML = '<p style="color:red;">Error al cargar lista.</p>';
      }
  };

  // Helper para mapear el tipo de servicio de la BD a la URL del frontend
  function getServiceTypeUrl(typeDb) {
      if (!typeDb) return 'vuelos'; // Default
      const t = typeDb.toLowerCase();
      if (t.includes('vuelo')) return 'vuelos';
      if (t.includes('hotel') || t.includes('hospedaje')) return 'alojamientos';
      if (t.includes('crucero')) return 'viajes';
      if (t.includes('traslado')) return 'traslados';
      if (t.includes('actividad')) return 'actividades';
      return 'vuelos';
  }

  window.removeFromWishlist = async (id, typeGroup) => {
      const userId = localStorage.getItem('userId');
      if(!confirm('¿Eliminar de la lista?')) return;

      const endpoint = typeGroup === 'packages' ? '/api/wishlist/package' : '/api/wishlist/service';
      const body = typeGroup === 'packages' 
          ? { usuario_id: userId, paquete_id: id } 
          : { usuario_id: userId, servicio_id: id };

      try {
          const res = await fetch(endpoint, {
              method: 'DELETE',
              headers: {'Content-Type': 'application/json'},
              body: JSON.stringify(body)
          });
          const json = await res.json();
          if(json.ok) {
              loadWishes(typeGroup); // Recargar lista
          } else {
              alert(json.message);
          }
      } catch(e) { console.error(e); }
  };

  // Cargar por defecto al iniciar
  document.addEventListener('DOMContentLoaded', () => {
      if(document.getElementById('wishlistContainer')) {
          loadWishes('services');
      }
  });

})();