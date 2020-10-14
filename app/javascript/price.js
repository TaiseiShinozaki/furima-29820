window.addEventListener("DOMContentLoaded", () => {
  const path = location.pathname
  const pathRegex = /^(?=.*item)(?=.*edit)/
  if (path === "/items/new" || pathRegex.test(path)) {

    const priceInput = document.getElementById("item-price");
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    priceInput.addEventListener("input", () => {
      const inputValue = document.getElementById("item-price").value;
        addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
        profitDom.innerHTML = Math.floor(inputValue * 0.9).toLocaleString();
    })
  }
});

//window.addEventListener("DOMContentLoaded", () => {
    //window=商品出品ページの事。addEventListener=画面を内容を変更するぜというメソッド
    //DOMContentLoaded=第一引数
  //const path = location.pathname //現在のパス
  //const pathRegex = /^(?=.*item)(?=.*edit)/ //商品id関係なく適用される
  //if (path === "/items/new" || pathRegex.test(path)) {
    //    出品ページの場合 || 商品編集の場合
    //const priceInput = document.getElementById("item-price");
    //const addTaxDom = document.getElementById("add-tax-price");
    //const profitDom = document.getElementById("profit");

    //priceInput.addEventListener("input", () => {
      //const inputValue = document.getElementById("item-price").value;
        //addTaxDom.innerHTML = Math.floor(inputValue * 0.1).toLocaleString();
        //profitDom.innerHTML = Math.floor(inputValue * 0.9).toLocaleString();
    //})
  //}
//});
