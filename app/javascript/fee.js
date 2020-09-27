

window.addEventListener('load', function(){
// setInterval(check, 1000, function(){
  const inputPrice = document.getElementById("item-price");

  inputPrice.addEventListener("keyup", () => {
    const price = inputPrice.value
    const feeCalc = Math.floor(price * 0.1)
    const profitCalc = price - feeCalc
    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML = feeCalc
    
    const profit = document.getElementById("profit")
    profit.innerHTML = profitCalc
  })
  

})
// setInterval(check, 1000);