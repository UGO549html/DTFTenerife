# write-site.ps1
# Sobrescribe/crea los archivos del sitio DTF FUEGO en la carpeta actual del script.
# Ejecuta desde: cd "E:\Usuario\PROYECTOS HUGO\POYECTOS WEB\Gemini\DTFTenerife"; .\write-site.ps1

$projectRoot = (Get-Location).Path
Write-Host "Usando carpeta de proyecto:" $projectRoot

# Asegurar carpetas
New-Item -ItemType Directory -Force -Path (Join-Path $projectRoot "js") | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $projectRoot "images") | Out-Null

# index.html
$index = @'
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>DTF FUEGO — DTF Transfers Textil Personalizados en Tenerife</title>
  <meta name="description" content="DTF FUEGO: Producción y venta de DTF Transfers textil personalizados en Tenerife. Transfers por metro, envío local y personalización rápida.">
  <meta name="keywords" content="DTF Transfers, Textil, Personalizados, Tenerife, transfers por metro">
  <meta property="og:title" content="DTF FUEGO — DTF Transfers Textil Personalizados en Tenerife">
  <meta property="og:description" content="DTF FUEGO: Producción y venta de DTF Transfers textil personalizados en Tenerife. Transfers por metro, envío local y personalización rápida.">
  <meta property="og:image" content="images/og-1200x630.jpg">
  <meta property="og:type" content="website">
  <meta property="og:locale" content="es_ES">
  <meta name="twitter:card" content="summary_large_image">
  <meta name="twitter:title" content="DTF FUEGO — DTF Transfers Textil">
  <meta name="twitter:description" content="Producción y venta de DTF Transfers textil personalizados en Tenerife.">
  <meta name="twitter:image" content="images/og-1200x630.jpg">
  <link rel="icon" href="images/favicon-32.png" sizes="32x32" type="image/png">
  <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="style.css">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;900&family=Oswald:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
  <header class="site-header">
    <div class="header-bg"></div>
    <nav class="nav container">
      <a class="brand" href="index.html">
        <img src="images/logo.png" alt="Logo DTF FUEGO" class="logo">
        <span class="brand-name">DTF FUEGO</span>
      </a>
      <ul class="nav-links">
        <li><a href="index.html">Inicio</a></li>
        <li><a href="catalogo.html">Catálogo</a></li>
        <li><a href="cesta.html">Cesta <span id="cart-count" class="cart-count">0</span></a></li>
        <li><a href="contacto.html">Contacto</a></li>
      </ul>
      <button class="nav-toggle" aria-label="Abrir menú">☰</button>
    </nav>

    <div class="hero container">
      <div class="hero-text">
        <h1 class="title glow">DTF FUEGO</h1>
        <p class="lead">Transfers DTF personalizados por metro — Producción rápida en Tenerife</p>
        <div class="hero-cta">
          <a class="btn primary" href="catalogo.html">Ver catálogo</a>
          <a class="btn outline" href="contacto.html">Contacto / WhatsApp</a>
        </div>
      </div>
      <img src="images/hero-sample.png" alt="DTF Transfers por metro para camisetas en Tenerife" class="hero-image">
    </div>
  </header>

  <main class="container main-content">
    <section class="about">
      <h2>¿Qué es DTF FUEGO?</h2>
      <p>Somos un taller en Tenerife especializado en <strong>DTF Transfers</strong> para prendas textiles. Producción por metros, acabados de alta calidad y opción de personalización por stickers o tiras.</p>
    </section>

    <section class="products" id="products">
      <h2>Productos destacados</h2>
      <div class="grid" id="product-list">
        <!-- Productos renderizados por JS -->
      </div>
    </section>

    <section class="prices">
      <h2>Precios orientativos (por metro)</h2>
      <ul>
        <li><strong>DTF Básico</strong>: 8 €/metro</li>
        <li><strong>DTF Full Color</strong>: 12 €/metro</li>
        <li><strong>Acabado Premium</strong>: +4 €/metro</li>
      </ul>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <p>DTF FUEGO — Tenerife • <a href="mailto:info@dtffuego.example">info@dtffuego.example</a> • <a href="https://wa.me/34625286488" target="_blank" rel="noopener">WhatsApp: 625 286 488</a></p>
      <p class="small">Diseño y producción local. Imágenes y logo: solicita al diseñador.</p>
    </div>
  </footer>

  <script src="js/main.js"></script>
</body>
</html>
'@

Set-Content -Path (Join-Path $projectRoot "index.html") -Value $index -Encoding UTF8

# catalogo.html
$catalogo = @'
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Catálogo — DTF FUEGO</title>
  <meta name="description" content="Catálogo de DTF FUEGO: seleccione y personalice sus transfers DTF por metro. Tenerife.">
  <meta name="keywords" content="catalogo DTF, transfers, Tenerife, personalizar">
  <meta property="og:title" content="Catálogo — DTF FUEGO">
  <meta property="og:description" content="Catálogo de DTF FUEGO: seleccione y personalice sus transfers DTF por metro. Tenerife.">
  <meta property="og:image" content="images/og-1200x630.jpg">
  <meta name="twitter:card" content="summary_large_image">
  <link rel="icon" href="images/favicon-32.png" sizes="32x32" type="image/png">
  <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
  <link rel="stylesheet" href="style.css">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;900&family=Oswald:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
  <header class="site-header small">
    <nav class="nav container">
      <a class="brand" href="index.html">
        <img src="images/logo.png" alt="Logo DTF FUEGO" class="logo">
        <span class="brand-name">DTF FUEGO</span>
      </a>
      <ul class="nav-links">
        <li><a href="index.html">Inicio</a></li>
        <li><a href="catalogo.html">Catálogo</a></li>
        <li><a href="cesta.html">Cesta <span id="cart-count" class="cart-count">0</span></a></li>
        <li><a href="contacto.html">Contacto</a></li>
      </ul>
    </nav>
  </header>

  <main class="container main-content">
    <section>
      <h1>Catálogo de DTF Transfers</h1>
      <p>Simula la personalización y añade metros a la cesta. (Interfaz de ejemplo para tiendas locales)</p>
      <div id="product-list" class="grid"></div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <p>DTF FUEGO — Tenerife</p>
    </div>
  </footer>

  <script src="js/main.js"></script>
</body>
</html>
'@

Set-Content -Path (Join-Path $projectRoot "catalogo.html") -Value $catalogo -Encoding UTF8

# cesta.html
$cesta = @'
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Cesta — DTF FUEGO</title>
  <meta name="description" content="Resumen de la cesta de compra de DTF FUEGO. Gestiona cantidades y simula el pago.">
  <link rel="icon" href="images/favicon-32.png" sizes="32x32" type="image/png">
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <header class="site-header small">
    <nav class="nav container">
      <a class="brand" href="index.html">
        <img src="images/logo.png" alt="Logo DTF FUEGO" class="logo">
        <span class="brand-name">DTF FUEGO</span>
      </a>
      <ul class="nav-links">
        <li><a href="index.html">Inicio</a></li>
        <li><a href="catalogo.html">Catálogo</a></li>
        <li><a href="cesta.html">Cesta <span id="cart-count" class="cart-count">0</span></a></li>
        <li><a href="contacto.html">Contacto</a></li>
      </ul>
    </nav>
  </header>

  <main class="container main-content">
    <h1>Tu Cesta</h1>
    <div id="cart">
      <!-- Carrito renderizado por JS -->
    </div>
    <div id="cart-actions" class="cart-actions">
      <button id="clear-cart" class="btn outline">Vaciar cesta</button>
      <button id="checkout" class="btn primary">Finalizar compra (simulado)</button>
    </div>
  </main>

  <footer class="site-footer">
    <div class="container">
      <p>DTF FUEGO — Tenerife</p>
    </div>
  </footer>

  <script src="js/main.js"></script>
</body>
</html>
'@

Set-Content -Path (Join-Path $projectRoot "cesta.html") -Value $cesta -Encoding UTF8

# contacto.html
$contacto = @'
<!doctype html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Contacto — DTF FUEGO</title>
  <meta name="description" content="Contacto con DTF FUEGO en Tenerife. Envíanos un correo o chatea por WhatsApp para pedidos y cotizaciones.">
  <meta property="og:title" content="Contacto — DTF FUEGO">
  <meta property="og:description" content="Contacta con DTF FUEGO en Tenerife para pedidos de transfers DTF personalizados.">
  <meta property="og:image" content="images/og-1200x630.jpg">
  <meta name="twitter:card" content="summary">
  <link rel="icon" href="images/favicon-32.png" sizes="32x32" type="image/png">
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <header class="site-header small">
    <nav class="nav container">
      <a class="brand" href="index.html">
        <img src="images/logo.png" alt="Logo DTF FUEGO" class="logo">
        <span class="brand-name">DTF FUEGO</span>
      </a>
      <ul class="nav-links">
        <li><a href="index.html">Inicio</a></li>
        <li><a href="catalogo.html">Catálogo</a></li>
        <li><a href="cesta.html">Cesta <span id="cart-count" class="cart-count">0</span></a></li>
        <li><a href="contacto.html">Contacto</a></li>
      </ul>
    </nav>
  </header>

  <main class="container main-content">
    <h1>Contacto</h1>
    <p>Puedes escribirnos por correo o usar el botón de WhatsApp para cotizaciones rápidas.</p>

    <section class="contact-grid">
      <form id="contact-form" action="mailto:info@dtffuego.example" method="post" enctype="text/plain">
        <label>Nombre
          <input type="text" name="name" required>
        </label>
        <label>Correo
          <input type="email" name="email" required>
        </label>
        <label>Mensaje
          <textarea name="message" rows="5" required></textarea>
        </label>
        <button type="submit" class="btn primary">Enviar correo</button>
      </form>

      <div class="contact-info">
        <h2>Contacto rápido</h2>
        <p>Email: <a href="mailto:info@dtffuego.example">info@dtffuego.example</a></p>
        <p>WhatsApp: <a href="https://wa.me/34625286488?text=Hola%20DTF%20FUEGO,%20quiero%20informaci%C3%B3n%20sobre%20transfers" target="_blank">Enviar mensaje (625 286 488)</a></p>
        <p>Dirección: Tenerife (envío local y recogida)</p>
      </div>
    </section>
  </main>

  <footer class="site-footer">
    <div class="container">
      <p>DTF FUEGO — Tenerife</p>
    </div>
  </footer>

  <script src="js/main.js"></script>
</body>
</html>
'@

Set-Content -Path (Join-Path $projectRoot "contacto.html") -Value $contacto -Encoding UTF8

# style.css
$style = @'
:root{
  --bg:#000000;
  --accent:#ff4500; /* naranja fuego */
  --muted:#a5a5a5;
  --glass: rgba(255,255,255,0.04);
  --container-width:1100px;
}
*{box-sizing:border-box}
body{margin:0;font-family:"Montserrat",system-ui,-apple-system,Segoe UI,Roboto,"Helvetica Neue",Arial; background:var(--bg) url("images/logo-bg.png") center/15% no-repeat fixed;color:#fff;-webkit-font-smoothing:antialiased}
.container{max-width:var(--container-width);margin:0 auto;padding:1rem}
.nav{display:flex;align-items:center;justify-content:space-between;padding:0.5rem 0}
.brand{display:flex;align-items:center;gap:0.6rem;text-decoration:none;color:inherit}
.logo{height:45px;width:auto;animation:float 6s ease-in-out infinite}
.brand-name{font-weight:900;letter-spacing:1px}
.nav-links{list-style:none;display:flex;gap:1rem;margin:0;padding:0}
.nav-links a{color:#fff;text-decoration:none;padding:0.4rem 0.6rem;border-radius:6px}
.nav-toggle{display:none}

.site-header{position:relative;overflow:hidden}
.header-bg{background-image:url("images/header-bg.jpg");background-size:cover;background-position:center;height:260px;filter:brightness(0.35);position:absolute;inset:0}
.hero{display:flex;align-items:center;gap:2rem;padding:4rem 0;position:relative}
.hero-text{max-width:600px}
.title{font-family:"Oswald",sans-serif;font-size:3.2rem;margin:0}
.glow{text-shadow:0 0 8px rgba(255,69,0,0.8),0 2px 18px rgba(0,0,0,0.6)}
.lead{color:var(--muted);font-size:1.05rem}
.hero-image{max-width:320px;width:40%;border-radius:8px;box-shadow:0 8px 30px rgba(0,0,0,0.6)}

.btn{display:inline-block;padding:0.6rem 1rem;border-radius:10px;text-decoration:none;font-weight:700;border:2px solid.transparent;cursor:pointer}
.btn.primary{background:linear-gradient(90deg,var(--accent),#ff7a2d);color:#111}
.btn.outline{background:transparent;border-color:var(--accent);color:var(--accent)}
.btn:hover{transform:translateY(-3px);box-shadow:0 8px 30px rgba(255,69,0,0.14)}

.main-content{padding:2rem 0}
.about p{color:var(--muted);line-height:1.6}
.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:1rem}
.product{background:linear-gradient(180deg,rgba(255,255,255,0.03),transparent);padding:1rem;border-radius:12px}
.product img{width:100%;height:160px;object-fit:cover;border-radius:8px}
.product h3{margin:0.5rem 0}
.price{font-weight:900;color:var(--accent)}

.site-footer{border-top:1px solid rgba(255,255,255,0.04);padding:1.5rem 0;margin-top:2rem;color:var(--muted)}
.small{font-size:0.9rem;color:var(--muted)}

.cart-count{background:var(--accent);color:#111;padding:0.08rem 0.4rem;border-radius:8px;margin-left:6px;font-weight:900}

/* Contact grid */
.contact-grid{display:grid;grid-template-columns:1fr 320px;gap:1.2rem}
form label{display:block;margin-bottom:0.6rem;color:var(--muted)}
input,textarea,select{width:100%;padding:0.6rem;border-radius:8px;border:1px solid rgba(255,255,255,0.06);background:transparent;color:#fff}

.cart-actions{display:flex;gap:1rem;margin-top:1rem}

@keyframes float{0%{transform:translateY(0)}50%{transform:translateY(-6px)}100%{transform:translateY(0)}}

/* Responsive */
@media (max-width:900px){
  .hero{flex-direction:column;text-align:center}
  .hero-image{width:60%}
  .contact-grid{grid-template-columns:1fr}
  .nav-links{display:none}
  .nav-toggle{display:block;background:transparent;border:0;color:#fff;font-size:1.4rem}
}

@media (max-width:480px){
  .title{font-size:2.4rem}
  body{background-size:12%}
}

/* Accessibility focus */
a:focus,button:focus,input:focus,textarea:focus{outline:2px dashed rgba(255,69,0,0.6);outline-offset:3px}
'@

Set-Content -Path (Join-Path $projectRoot "style.css") -Value $style -Encoding UTF8

# js/main.js
$js = @'
/* js/main.js
   Funcionalidad mínima: lista productos, añadir a carrito, persistencia en localStorage
*/

const PRODUCTS = [
  {id:1,title:\'DTF Básico (por metro)\',price:8,desc:\'DTF calidad estándar, ideal para tiradas grandes\',img:\'images/product1.jpg\'},
  {id:2,title:\'DTF Full Color (por metro)\',price:12,desc:\'Full color vibrante, ideal para diseños complejos\',img:\'images/product2.jpg\'},
  {id:3,title:\'DTF Premium (por metro)\',price:16,desc:\'Acabado premium y mayor durabilidad\',img:\'images/product3.jpg\'}
];

function $(sel){return document.querySelector(sel)}
function $all(sel){return document.querySelectorAll(sel)}

/* Cart helpers */
function loadCart(){
  try{const raw = localStorage.getItem('dtfCart'); return raw? JSON.parse(raw): []}catch(e){return []}
}
function saveCart(cart){localStorage.setItem('dtfCart',JSON.stringify(cart)); updateCartCount()}
function updateCartCount(){
  const count = loadCart().reduce((s,i)=>s+Number(i.qty||0),0);
  $all('#cart-count').forEach(el=>el.textContent = count);
}

/* Render products in catalog and index */
function renderProducts(){
  const list = $('#product-list'); if(!list) return;
  list.innerHTML='';
  for(const p of PRODUCTS){
    const card = document.createElement('article'); card.className='product';
    card.innerHTML = `
      <img src="${p.img}" alt="${p.title} - DTF Transfers por metro para camisetas en Tenerife">
      <h3>${p.title}</h3>
      <p class="small">${p.desc}</p>
      <p class="price">${p.price} €/m</p>
      <label>Cantidad (metros)
        <input type="number" min="1" value="1" class="qty-input" data-id="${p.id}">
      </label>
      <p><button class="btn primary add-to-cart" data-id="${p.id}">Añadir a cesta</button></p>
    `;
    list.appendChild(card);
  }
  // attach handlers
  $all('.add-to-cart').forEach(btn=>btn.addEventListener('click', ()=>{
    const id = Number(btn.dataset.id); const input = document.querySelector(`.qty-input[data-id="${id}"]`);
    const qty = Math.max(1, Number(input.value||1)); addToCart(id,qty);
  }))
}

function addToCart(productId, qty){
  const product = PRODUCTS.find(p=>p.id===productId); if(!product) return;
  const cart = loadCart();
  const existing = cart.find(i=>i.id===productId);
  if(existing){ existing.qty = Number(existing.qty) + Number(qty); }
  else{ cart.push({id:product.id,title:product.title,price:product.price,qty:Number(qty)}) }
  saveCart(cart);
  alert(`${qty} m agregado(s) de "${product.title}" a la cesta.`);
}

/* Cart page rendering */
function renderCartPage(){
  const cartEl = $('#cart'); if(!cartEl) return;
  const cart = loadCart();
  if(cart.length===0){ cartEl.innerHTML = '<p>La cesta está vacía.</p>'; return }
  let html = '<table class="cart-table"><thead><tr><th>Producto</th><th>Precio</th><th>m</th><th>Subtotal</th><th></th></tr></thead><tbody>';
  let total = 0;
  for(const item of cart){
    const sub = item.price * item.qty; total += sub;
    html += `<tr data-id="${item.id}"><td>${item.title}</td><td>${item.price} €/m</td><td><input type="number" class="cart-qty" value="${item.qty}" min="1"></td><td>${sub.toFixed(2)} €</td><td><button class="remove-item btn outline">Eliminar</button></td></tr>`;
  }
  html += `</tbody></table><p class="price">Total: ${total.toFixed(2)} €</p>`;
  cartEl.innerHTML = html;

  // attach handlers
  $all('.remove-item').forEach(btn=>btn.addEventListener('click', (e)=>{
    const row = e.target.closest('tr'); const id = Number(row.dataset.id);
    const newCart = loadCart().filter(i=>i.id!==id); saveCart(newCart); renderCartPage();
  }));

  $all('.cart-qty').forEach((input, idx)=>{
    input.addEventListener('change', (e)=>{
      const rows = document.querySelectorAll('tbody tr');
      const row = rows[idx]; const id = Number(row.dataset.id);
      const cart = loadCart(); const item = cart.find(i=>i.id===id); if(!item) return;
      item.qty = Math.max(1, Number(e.target.value||1)); saveCart(cart); renderCartPage();
    })
  })
}

/* Clear cart and checkout actions */
function setupCartActions(){
  const clear = $('#clear-cart'); if(clear) clear.addEventListener('click', ()=>{ if(confirm('Vaciar la cesta?')){ saveCart([]); renderCartPage(); } });
  const checkout = $('#checkout'); if(checkout) checkout.addEventListener('click', ()=>{
    const cart = loadCart(); if(cart.length===0){ alert('La cesta está vacía.'); return }
    // simulación simple
    const total = cart.reduce((s,i)=>s+i.price*i.qty,0);
    alert(`Compra simulada: Total ${total.toFixed(2)} €. Contactaremos para pago y envío.`);
    // después de comprar, vaciamos la cesta
    saveCart([]); renderCartPage();
  })
}

/* Init for pages */
document.addEventListener('DOMContentLoaded', ()=>{
  // render products where appropriate
  renderProducts();
  updateCartCount();
  renderCartPage();
  setupCartActions();

  // nav toggle small screens
  const toggle = document.querySelector('.nav-toggle'); if(toggle){
    toggle.addEventListener('click', ()=>{
      const links = document.querySelector('.nav-links'); if(links.style.display==='flex') links.style.display='none'; else links.style.display='flex';
    })
  }
});
'@

Set-Content -Path (Join-Path $projectRoot "js\main.js") -Value $js -Encoding UTF8

# README.md
$readme = @'
# DTF FUEGO — Tienda DTF Transfers (Listo para GitHub Pages)

Pequeño sitio estático para una tienda local de DTF Transfers en Tenerife. Esta estructura está pensada para desplegar en GitHub Pages como un sitio estático.

Archivos incluidos:

- `index.html` — Página principal (SEO: título, descripción, keywords)
- `catalogo.html` — Catálogo con simulador de personalización y botones "Añadir a cesta"
- `cesta.html` — Resumen de la cesta (uso de `localStorage` para persistir)
- `contacto.html` — Formulario y enlace a WhatsApp
- `style.css` — Estilos: tema oscuro, tipografías, efectos, responsive
- `js/main.js` — Lógica para renderizar productos y carrito (simulado)
- `images/` — Carpeta para imágenes: `logo.png`, `header-bg.jpg`, `hero-sample.png`, `product1.jpg`, `product2.jpg`, `product3.jpg`, `logo-bg.png`

Cómo usar y desplegar (pasos mínimos):

1. Crear un repositorio en GitHub (ej. `dtf-fuego`) y subir todo el contenido de esta carpeta.
2. Asegúrate de subir la carpeta `images/` con tus imágenes: logo en `images/logo.png` y `images/header-bg.jpg`.
3. En GitHub: Settings → Pages: selecciona branch `main` y carpeta `/ (root)`.

Instrucciones rápidas para guardar las imágenes (Windows PowerShell):

```powershell
New-Item -ItemType Directory -Force -Path "E:\Usuario\PROYECTOS HUGO\POYECTOS WEB\Gemini\DTFTenerife\images"

Move-Item -Path "C:\Users\<TuUsuario>\Downloads\dtf_logo.png" -Destination "E:\Usuario\PROYECTOS HUGO\POYECTOS WEB\Gemini\DTFTenerife\images\logo.png"
Move-Item -Path "C:\Users\<TuUsuario>\Downloads\dtf_header.jpg" -Destination "E:\Usuario\PROYECTOS HUGO\POYECTOS WEB\Gemini\DTFTenerife\images\header-bg.jpg"
