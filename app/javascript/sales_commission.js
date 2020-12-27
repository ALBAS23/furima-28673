const calculation = () => {
  const input = document.getElementById('item-price');
  input.addEventListener('input',() => {
    let price = document.getElementById('item-price').value;
    let add_tax_price = Math.trunc(price * 0.1);
    let profit = price - add_tax_price;
    document.getElementById('add-tax-price').innerHTML = add_tax_price.toLocaleString();
    document.getElementById('profit').innerHTML = profit.toLocaleString();
  });
};

window.addEventListener('load', calculation);