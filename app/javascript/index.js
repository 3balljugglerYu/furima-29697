
const confirm = () => {
  const form = document.getElementById("itemConfirm");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    var result = window.confirm('出品してよろしいですか？');
    
    if( result ) {
      document.getElementById("itemConfirm").submit();
    }
    else{
      document.getElementById("itemSubmit").disabled = false;
    }
  });
};
window.addEventListener("load", confirm);