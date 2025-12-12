(() => {
  const year = new Date().getFullYear();
  const yearTarget = document.querySelector('[data-current-year]');
  if (yearTarget) {
    yearTarget.textContent = year;
  }
})();
