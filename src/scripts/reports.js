(() => {
  const handleReportGeneration = async (event) => {
    const button = event.target;
    const fnKey = button.dataset.fnkey;

    if (!fnKey) return;

    const originalText = button.textContent;
    button.disabled = true;
    button.textContent = 'Generando...';

    try {
      const response = await fetch('/api/jasper', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ fnKey }),
      });

      if (!response.ok) {
        const errorData = await response.json();
        throw new Error(errorData.error || 'Error en el servidor al generar el reporte.');
      }

      const blob = await response.blob();
      const url = window.URL.createObjectURL(blob);
      
      // Abrir PDF en una nueva pestaña
      window.open(url, '_blank');

    } catch (error) {
      console.error('Error al generar el reporte:', error);
      alert(`No se pudo generar el reporte: ${error.message}`);
    } finally {
      button.disabled = false;
      button.textContent = originalText;
    }
  };

  document.addEventListener('DOMContentLoaded', () => {
    const reportButtons = document.querySelectorAll('.report-btn');
    reportButtons.forEach(button => {
      button.addEventListener('click', handleReportGeneration);
    });
  });
})();
