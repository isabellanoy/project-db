(() => {
  const userId = localStorage.getItem('userId');
  if (!userId) window.location.href = '/login'; // Redirección limpia

  // Referencias UI
  const totalLabel = document.querySelector('.summary-total span:last-child');
  const payBtn = document.querySelector('aside button.cta-button'); // Botón Pagar
  const financeCheckbox = document.querySelector('input[name="finance"]');
  
  // Inputs de Pago (Simulados para el ejemplo: Tarjeta)
  const cardInputs = {
    number: document.querySelector('input[placeholder="Número de Tarjeta"]'), // Ajustaremos el HTML para que coincida
    holder: document.querySelector('input[placeholder="Titular"]'),
    amount: document.querySelector('input[placeholder="Monto a pagar"]')
  };

  let totalAmount = 0;

  // 1. Cargar Monto Total
  const loadSummary = async () => {
    try {
      const response = await fetch(`/api/sales/itinerary?usuario_id=${userId}`);
      const payload = await response.json();
      if (!payload.ok) throw new Error(payload.message);

      const data = payload.data;
      if (!data || data.empty) {
        alert('Tu carrito está vacío');
        window.location.href = '/busqueda';
        return;
      }

      totalAmount = parseFloat(data.info.co_monto_total);
      
      // Actualizar UI
      if(totalLabel) totalLabel.textContent = `$${totalAmount.toFixed(2)}`;
      
      // Pre-llenar monto a pagar (por defecto total)
      const amountInput = document.getElementById('paymentAmount');
      if(amountInput) amountInput.value = totalAmount.toFixed(2);

    } catch (error) {
      console.error(error);
    }
  };

  // 2. Procesar Pago
  const handlePayment = async () => {
    payBtn.disabled = true;
    payBtn.textContent = 'Procesando...';

    const isFinance = financeCheckbox ? financeCheckbox.checked : false;
    const amountToPay = document.getElementById('paymentAmount').value;
    
    // Datos falsos de tarjeta para probar (el HTML debe tener estos campos)
    // En producción, esto viene de los inputs reales
    const cardData = {
        usuario_id: userId,
        monto: amountToPay,
        numero: "1234567890123456", // Mock
        cvc: 123,
        titular: "Usuario Prueba",
        vencimiento: "2028-12-01",
        banco_id: 1, // ID de un banco existente en tu BD (ej: Banco Venezuela)
        emisor: "VISA"
    };

    try {
      // A. Iniciar el checkout (Cambiar estado a PAGANDO)
      // Nota: Si ya está en PAGANDO, el backend devolverá error o lo manejará.
      // Para simplificar, intentamos iniciarlo siempre.
      await fetch('/api/sales/checkout/init', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ 
            usuario_id: userId, 
            financiado: isFinance,
            cuotas: isFinance ? 3 : 1 
        })
      });

      // B. Registrar el Pago (Tarjeta en este ejemplo)
      const payResponse = await fetch('/api/sales/checkout/pay/card', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(cardData)
      });

      const payResult = await payResponse.json();

      if (payResult.ok) {
        alert('¡Pago realizado con éxito! Tu viaje está confirmado.');
        window.location.href = '/mis-viajes'; // Redirección a ruta limpia
      } else {
        throw new Error(payResult.message);
      }

    } catch (error) {
      alert(`Error en el pago: ${error.message}`);
      payBtn.disabled = false;
      payBtn.textContent = 'Pagar';
    }
  };

  document.addEventListener('DOMContentLoaded', () => {
    loadSummary();
    if(payBtn) payBtn.addEventListener('click', handlePayment);
  });
})();