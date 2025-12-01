# Proyecto de Bases de Datos

Este repositorio recoge el esqueleto visual de un dashboard que se alimentará con datos reales desde SQL.

## Qué está listo
- Layouts semánticos en HTML5 con componentes reutilizables de navegación, tablas y tarjetas.
- Hoja de estilos única (`src/styles/styles.css`) con Flexbox/Grid y utilidades listas para dashboards, formularios y CRUDs.
- Más de diez vistas organizadas por contexto (`home`, `search`, `booking`, `user`, `admin`, `provider`). Cada vista incluye comentarios `TODO` donde deben aterrizar los datos dinámicos.
- Carpeta `database/` reservada para scripts SQL, seeds o documentación del modelo.
- Backend Express con soporte para PostgreSQL, CORS y variables de entorno listas para consumir los scripts SQL.
- `lite-server` sigue disponible para previsualizar únicamente el frontend mediante un script dedicado.

## Estructura en modo bird’s-eye view
```
.
├── index.html                # Landing principal con indicadores mock
├── src/
│   ├── styles/styles.css     # Sistema de estilos centralizado
│   ├── scripts/main.js       # Hooks ligeros (fecha dinámica, etc.)
│   └── views/
│       ├── home/             # Página de exploración
│       ├── search/           # Resultados y detalle de productos
│       ├── booking/          # Itinerario + checkout
│       ├── user/             # Perfil del viajero
│       ├── admin/            # Gestión y reportes
│       └── provider/         # Panel para aliados
├── database/README.md        # Notas para las futuras consultas SQL
├── server.js                 # Servidor Express + PostgreSQL
├── .env.example              # Plantilla con credenciales requeridas
└── package.json              # Scripts y dependencias de desarrollo
```

## Requisitos previos
- Node.js 18 o superior (las herramientas de npm que usamos dejaron de soportar versiones 16/17).

## Variables de entorno
1. Copia el archivo `.env.example` a `.env` en la raíz del proyecto.
2. Completa las credenciales reales de PostgreSQL (`DB_USER`, `DB_HOST`, `DB_DATABASE`, `DB_PASSWORD`, `DB_PORT`).
3. Ajusta `DB_SSL` y `PORT` si necesitas conectarte a servicios gestionados o usar otro puerto.

## Puesta en marcha
```powershell
npm install
npm start
```
1. `npm install` instala Express, pg, dotenv, cors y el resto de dependencias declaradas.
2. `npm start` levanta el servidor Express en `http://localhost:3000`, sirve el frontend desde `src/` + `index.html` y expone rutas API (por ejemplo, `/api/health`).

> ¿Solo quieres revisar las vistas estáticas? Ejecuta `npm run dev:frontend` para usar `lite-server` como antes.

## cómo navegar las vistas
- `index.html`: tablero académico con tarjetas de indicadores y tablas de resumen.
- `src/views/home/home.html`: landing comercial de ViajesUCAB.
- `src/views/search/*`: buscador, resultados y detalle de ofertas.
- `src/views/booking/*`: itinerario y flujo de pago fraccionado.
- `src/views/admin/*` y `src/views/provider/*`: pantallas tipo backoffice.

Todas las áreas donde deben inyectarse datos reales están marcadas con comentarios `TODO`. En cuanto exista la capa de datos/servicios, basta con reemplazar esos mocks.

## API disponible actualmente

El backend ahora expone las siguientes rutas conectadas a los procedimientos almacenados en PostgreSQL:

| Método | Ruta | Descripción | Procedimiento/Función |
| --- | --- | --- | --- |
| `POST` | `/api/auth/login` | Valida credenciales de usuario. | `sp_login_usuario` |
| `POST` | `/api/auth/register` | Registra cliente, usuario y método de pago inicial. | `sp_registrar_cliente` |
| `GET` | `/api/auth/me` | Devuelve el perfil completo del cliente autenticado (requiere `usuario_cod`). | `sp_obtener_cliente_por_usuario` |
| `POST` | `/api/auth/change-password` | Cambia la contraseña validando la clave actual. | `sp_cambiar_clave_usuario` |
| `GET` | `/api/aerolineas` | Lista todas las aerolíneas disponibles. | `fn_buscar_aerolineas` |
| `GET` | `/api/aerolineas/:id` | Obtiene una aerolínea específica. | `sp_obtener_aerolinea_por_id` |
| `POST` | `/api/aerolineas` | Crea una aerolínea validando lugar y fechas. | `sp_crear_aerolinea` |
| `PUT` | `/api/aerolineas/:id` | Actualiza una aerolínea permitiendo cambios parciales. | `sp_actualizar_aerolinea` |
| `DELETE` | `/api/aerolineas/:id` | Elimina una aerolínea si no tiene referencias activas. | `sp_eliminar_aerolinea` |
| `GET` | `/api/lugares` | Lista lugares con paginación (`limit`, `offset`). | `fn_buscar_lugares` |
| `GET` | `/api/lugares/:id/ancestros` | Devuelve la jerarquía hacia arriba del lugar. | `fn_obtener_ancestros_lugar` |
| `GET` | `/api/lugares/:id/descendientes` | Devuelve toda la descendencia del lugar. | `fn_obtener_descendientes_lugar` |
| `GET` | `/api/lugares/:id/ruta` | Retorna la ruta concatenada desde la raíz. | `fn_obtener_ruta_lugar` |
| `GET` | `/api/lugares/:id/hijos` | Lista los hijos directos de un lugar. | `fn_buscar_hijos_lugar` |
| `GET` | `/api/roles` | Lista todos los roles con su cantidad de permisos. | `fn_listar_todos_roles` |
| `GET` | `/api/roles/:id` | Obtiene un rol junto a su JSON de permisos. | `fn_obtener_rol_con_permisos` |
| `POST` | `/api/roles` | Crea un rol y asigna permisos opcionales. | `fn_crear_rol_con_permisos` |
| `PUT` | `/api/roles/:id/permisos/add` | Agrega permisos en lote a un rol. | `fn_agregar_permisos_a_rol` |
| `PUT` | `/api/roles/:id/permisos/remove` | Quita permisos en lote a un rol. | `fn_quitar_permisos_de_rol` |
| `GET` | `/api/permisos` | Lista los permisos disponibles. | `fn_listar_permisos_disponibles` |
| `GET` | `/api/servicios` | Consulta el catálogo base de servicios. | CRUD dinámico (`Servicio`) |
| `POST` | `/api/servicios` | Crea un servicio genérico. | CRUD dinámico (`Servicio`) |
| `GET` | `/api/servicios/vuelos` | Opera sobre vuelos programados. | CRUD dinámico (`Vuelo`) |
| `GET` | `/api/servicios/viajes` | Administra viajes/cruceros. | CRUD dinámico (`Viaje`) |
| `GET` | `/api/servicios/traslados` | Gestiona traslados terrestres. | CRUD dinámico (`Traslado`) |
| `GET` | `/api/servicios/habitaciones` | Controla inventario de habitaciones. | CRUD dinámico (`Habitacion`) |
| `GET` | `/api/servicios/servicios-adicionales` | Maneja actividades de operador turístico. | CRUD dinámico (`Servicio_Adicional`) |
| `GET` | `/api/servicios/servicios-barco` | Gestiona servicios a bordo. | CRUD dinámico (`Servicio_Barco`) |

> Todas las rutas de `/api/servicios/**` comparten los métodos `GET/POST/PUT/DELETE` gracias al generador CRUD reutilizable. Colocamos los `GET` en la tabla a modo de referencia del recurso administrado.

### Módulo de ventas y transacciones

- CRUD genérico disponible para `/api/compras`, `/api/quejas`, `/api/resenas` y `/api/reembolsos`.
- `/api/pagos` expone `GET /`, `GET /:compraId/:metodoId`, `POST`, `PUT`, `DELETE` respetando la clave compuesta (compra + método).
- Endpoints especializados para tablas con claves compuestas:
	- `POST /api/compras/:idCompra/boletos-vuelo`
	- `POST /api/compras/:idCompra/boletos-viaje`
	- `POST /api/compras/:idCompra/detalle-hospedaje`

Cada endpoint valida sus parámetros numéricos/fechas antes de ejecutar los `INSERT` directos, reduciendo errores en bases complejas.

Cada endpoint maneja errores con códigos `400` para validaciones y `500` para fallas inesperadas. Asegúrate de tener las tablas y procedimientos sincronizados antes de hacer peticiones.

### Scripts frontend conectados

- `src/scripts/auth.js`: intercepta el formulario de login para consumir `/api/auth/login`, muestra mensajes de estado y redirige a `home` en caso de éxito.
- `src/scripts/manageProviders.js`: al cargar la vista de administración de proveedores, consulta `/api/aerolineas` y renderiza las filas de la tabla dinámicamente para mantener los datos sincronizados con la base de datos.