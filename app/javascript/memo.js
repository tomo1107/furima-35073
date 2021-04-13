function calcTaxProfit(){
  const priceForm = document.getElementById("item-price");
  priceForm.addEventListener('keydown', () => {
    const form = document.getElementById("item-price");
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    addTaxPrice.innerHTML = (form.value * 0.1).toLocaleString(undefined, { maximumFractionDigits: 0 });
    profit.innerHTML = (form.value * 0.9).toLocaleString(undefined, { maximumFractionDigits: 0 });
  });
}

window.addEventListener('load', calcTaxProfit);