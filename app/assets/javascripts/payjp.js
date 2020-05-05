window.addEventListener('DOMContentLoaded', function(){
  let submit = document.getElementById("payment_card_submit-button");
  Payjp.setPublicKey('pk_test_11a1cbafd4b6f03d6a6e018b');
    submit.addEventListener('click', function(e){
    e.preventDefault();

    let card = { //カード入力フォームから情報を取得, フォームのidを記載する
      number: document.getElementById("card_number").Value,
      cvc: document.getElementById("card_cvc").vlalue,
      exp_month: document.getElementById("card_exp_month").vlalue,
      exp_year: document.getElementById("card_exp_year").vlalue
    };

    Payjp.createToken(card, function(status, response){
      if (status === 200) {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");
        $("#charge-form").append(
          $('<input type="hidden" name="payjp_token>').val(response.id)
        );
        document.inputForm.submit();
        alert("登録が完了しました");
      } else {
        alert("カード情報が正しくありません。");
      }
    });
  });
});
