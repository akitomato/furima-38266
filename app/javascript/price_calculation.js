window.addEventListener('load', function(){

  const item_price = document.getElementById("item-price");
  const add_tax_price = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  item_price.addEventListener("keyup", () => {
    add_tax_price.innerHTML = `${Math.floor(item_price.value * 0.1)}`;
    profit.innerHTML = `${Math.floor(item_price.value * 0.9)}`;
  })
})