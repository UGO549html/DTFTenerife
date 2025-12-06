/* js/main.js
   Funcionalidad mínima: lista productos, añadir a carrito, persistencia en localStorage
*/

const PRODUCTS = [
  {id:1,title:'DTF Básico (por metro)',price:8,desc:'DTF calidad estándar, ideal para tiradas grandes',img:'images/product1.jpg'},
  {id:2,title:'DTF Full Color (por metro)',price:12,desc:'Full color vibrante, ideal para diseños complejos',img:'images/product2.jpg'},
  {id:3,title:'DTF Premium (por metro)',price:16,desc:'Acabado premium y mayor durabilidad',img:'images/product3.jpg'}
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
/* js/main.js
   Funcionalidad mínima: lista productos, añadir a carrito, persistencia en localStorage
*/

const PRODUCTS = [
  {id:1,title:'DTF Básico (por metro)',price:8,desc:'DTF calidad estándar, ideal para tiradas grandes',img:'images/product1.jpg'},
  {id:2,title:'DTF Full Color (por metro)',price:12,desc:'Full color vibrante, ideal para diseños complejos',img:'images/product2.jpg'},
  {id:3,title:'DTF Premium (por metro)',price:16,desc:'Acabado premium y mayor durabilidad',img:'images/product3.jpg'}
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
