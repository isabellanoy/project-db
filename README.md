# Proyecto Universitario de Bases de Datos

Este repositorio recoge el esqueleto visual de un dashboard académico que luego se alimentará con datos reales desde SQL. El objetivo es avanzar primero en la experiencia de usuario (HTML + CSS) y después inyectar la capa de datos sin tener que rehacer el front.

## 🚀 Qué trae listo
- Layouts semánticos en HTML5 con componentes reutilizables de navegación, tablas y tarjetas.
- Hoja de estilos única (`src/styles/styles.css`) con Flexbox/Grid y utilidades listas para dashboards, formularios y CRUDs.
- Más de diez vistas organizadas por contexto (`home`, `search`, `booking`, `user`, `admin`, `provider`). Cada vista incluye comentarios `TODO` donde deben aterrizar los datos dinámicos.
- Carpeta `database/` reservada para scripts SQL, seeds o documentación del modelo.
- `lite-server` configurado para levantar el sitio con un simple `npm start` y recarga automática.

## �️ Estructura en modo bird’s-eye view
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
└── package.json              # Scripts y dependencias de desarrollo
```

## 🛠️ Requisitos previos
- Node.js 18 o superior (las herramientas de npm que usamos dejaron de soportar versiones 16/17).

## ⚙️ Puesta en marcha
```powershell
npm install
npm start
```
1. `npm install` descarga `lite-server` de manera local.
2. `npm start` abre `http://localhost:3000` y observa todos los `.html`, `.css` y `.js` del proyecto. Cada vez que guardes, el navegador se refresca solo.

## 🧭 Cómo navegar las vistas
- `index.html`: tablero académico con tarjetas de indicadores y tablas de resumen.
- `src/views/home/home.html`: landing comercial de ViajesUCAB.
- `src/views/search/*`: buscador, resultados y detalle de ofertas.
- `src/views/booking/*`: itinerario y flujo de pago fraccionado.
- `src/views/admin/*` y `src/views/provider/*`: pantallas tipo backoffice.

Todas las áreas donde deben inyectarse datos reales están marcadas con comentarios `TODO`. En cuanto exista la capa de datos/servicios, basta con reemplazar esos mocks.

## � Próximos pasos sugeridos
- Colocar scripts SQL, diagramas o seeds dentro de `database/` para dejar documentado el modelo.
- Conectar las vistas críticas (`index`, `search`, `booking`) con endpoints o mocks JSON para validar la experiencia.
- Sustituir los placeholders por componentes templating o un micro framework cuando se integre la lógica.

Si necesitas otra vista o quieres automatizar un flujo (por ejemplo, paginación real en tablas), abre un issue o describe el escenario y lo agregamos en la siguiente iteración.
