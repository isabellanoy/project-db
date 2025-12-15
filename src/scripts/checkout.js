(() => {
  const userId = localStorage.getItem('userId');
  if (!userId) window.location.href = '/login';

  // Referencias UI
  const totalAmountLabel = document.getElementById('totalAmountLabel');
  const regularPaymentDiv = document.getElementById('regularPayment');
  const packagePaymentDiv = document.getElementById('packagePayment');
  
    const confirmPaymentBtn = document.getElementById('confirmPaymentBtn');
    const payWithMilesBtn = document.getElementById('payWithMilesBtn');
    
    const financeCheckbox = document.querySelector('input[name="finance"]');
    
    // Referencias a los formularios y sus campos
    const cardForm = document.getElementById('card-form');
    const digitalForm = document.getElementById('digital-form');
    const paymentMethodRadios = document.querySelectorAll('input[name="paymentMethod"]');
  
    // Campos de Tarjeta
    const cardNumberInput = document.getElementById('card-number');
    const cardHolderInput = document.getElementById('card-holder');
    const cardExpiryInput = document.getElementById('card-expiry');
    const cardCvcInput = document.getElementById('card-cvc');
    const bankSelect = document.getElementById('bank-select');
    const cardIssuerInput = document.getElementById('card-issuer');
    const cardAmountInput = document.getElementById('card-amount');
  
    // Campos de Operación Digital
    const digitalRefInput = document.getElementById('digital-ref');
    const digitalAmountInput = document.getElementById('digital-amount');
  
    let totalAmount = 0;  let activePurchaseId = null;

  // 1. Cargar Bancos
  const loadBanks = async () => {
    try {
      const response = await fetch('/api/banks');
      const payload = await response.json();
      if (payload.ok && bankSelect) {
        bankSelect.innerHTML = '<option value="">Seleccione un banco...</option>';
        payload.data.forEach(bank => {
          const option = document.createElement('option');
          option.value = bank.ba_cod;
          option.textContent = bank.ba_nombre;
          bankSelect.appendChild(option);
        });
      }
    } catch (error) {
      console.error('Error cargando bancos:', error);
      if (bankSelect) bankSelect.innerHTML = '<option value="">Error al cargar bancos</option>';
    }
  };

  // 2. Cargar Resumen de la compra
  const loadSummary = async () => {
    try {
      const response = await fetch(`/api/checkout-summary?usuario_id=${userId}`);
      const payload = await response.json();
      if (!payload.ok) throw new Error(payload.message);

      const data = payload.data;
      if (!data || data.empty) {
        alert('Tu carrito está vacío');
        window.location.href = '/busqueda';
        return;
      }

      totalAmount = parseFloat(data.remainingAmount);
      activePurchaseId = data.purchaseId;
      const isPackage = data.isPackage === true;

      if (isPackage) {
        regularPaymentDiv.style.display = 'none';
        packagePaymentDiv.style.display = 'block';
        totalAmountLabel.textContent = `${totalAmount.toLocaleString('es-VE')} Millas`;
      } else {
        regularPaymentDiv.style.display = 'block';
        packagePaymentDiv.style.display = 'none';
        totalAmountLabel.textContent = `Bs. ${totalAmount.toFixed(2)}`;
        document.getElementById('card-amount').value = totalAmount.toFixed(2);
        document.getElementById('digital-amount').value = totalAmount.toFixed(2);
      }
    } catch (error) {
      console.error(error);
      totalAmountLabel.textContent = 'Error';
    }
  };

  // 3. Manejar el cambio de método de pago
  const handleMethodChange = (event) => {
    if (event.target.value === 'card') {
      cardForm.style.display = 'block';
      digitalForm.style.display = 'none';
    } else {
      cardForm.style.display = 'none';
      digitalForm.style.display = 'block';
    }
  };
  
  // 4. Procesar Pagos
  const handlePayment = async () => {
    const selectedMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
    
    confirmPaymentBtn.disabled = true;
    confirmPaymentBtn.textContent = 'Procesando...';

    const isFinance = financeCheckbox ? financeCheckbox.checked : false;

    try {
      // A. Iniciar el checkout (Cambiar estado a PAGANDO)
      await fetch('/api/checkout/init', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ 
            usuario_id: userId, 
            financiado: isFinance,
            cuotas: isFinance ? 3 : 1 
        })
      });

      // B. Registrar el Pago según el método
      let payEndpoint = '';
      let payBody = {};

      if (selectedMethod === 'card') {
        payEndpoint = '/api/checkout/pay/card';
        payBody = {
          usuario_id: userId,
          monto: document.getElementById('card-amount').value,
          numero: document.getElementById('card-number').value,
          cvc: document.getElementById('card-cvc').value,
          titular: document.getElementById('card-holder').value,
          vencimiento: document.getElementById('card-expiry').value, // Formato YYYY-MM
          banco_id: document.getElementById('bank-select').value,
          emisor: document.getElementById('card-issuer').value
        };
      } else { // digital
        payEndpoint = '/api/checkout/pay/digital';
        payBody = {
          usuario_id: userId,
          monto: document.getElementById('digital-amount').value,
          referencia: document.getElementById('digital-ref').value
        };
      }
      
      const payResponse = await fetch(payEndpoint, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payBody)
      });

      const payResult = await payResponse.json();

      if (payResult.ok) {
        alert('Pago procesado correctamente.');
        window.location.reload();
      } else {
        throw new Error(payResult.message);
      }

    } catch (error) {
      alert(`Error en el pago: ${error.message}`);
      confirmPaymentBtn.disabled = false;
      confirmPaymentBtn.textContent = 'Confirmar Pago';
    }
  };

  const handleMilesPayment = async () => {
    payWithMilesBtn.disabled = true;
    payWithMilesBtn.textContent = 'Procesando...';
    try {
      const payResponse = await fetch('/api/checkout/pay/package', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          usuario_id: userId
        })
      });

      const payResult = await payResponse.json();
      if (payResult.ok) {
        alert('¡Paquete pagado con éxito con tus millas!');
        window.location.href = '/mis-viajes';
      } else {
        throw new Error(payResult.message);
      }
    } catch (error) {
      alert(`Error en el pago: ${error.message}`);
      payWithMilesBtn.disabled = false;
      payWithMilesBtn.textContent = ' Pagar con Millas';
    }
  };

  // Asignar Event Listeners
  document.addEventListener('DOMContentLoaded', () => {
    loadSummary();
    loadBanks();
    paymentMethodRadios.forEach(radio => radio.addEventListener('change', handleMethodChange));
    if(confirmPaymentBtn) confirmPaymentBtn.addEventListener('click', handlePayment);
    if(payWithMilesBtn) payWithMilesBtn.addEventListener('click', handleMilesPayment);
  });
})();