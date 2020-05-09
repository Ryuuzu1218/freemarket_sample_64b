$(document).on('turbolinks:load', function() {
  Payjp.setPublicKey('pk_test_861be3c0878f019aa1b048f4');
    $('#payment_card_submit-button').on('click', function(e){
    e.preventDefault();

    let card = { //カード入力フォームから情報を取得, フォームのidを記載する
      number: document.getElementById("number").value,
      cvc: document.getElementById("cvc").value,
      exp_month: document.getElementById("exp_month").value,
      exp_year: '20' + document.getElementById("exp_year").value
    };

    Payjp.createToken(card, function(status, response){
      if (status === 200) {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");
        $("#charge-form").append(
          $('<input type="hidden" name="payjp_token">').val(response.id)
        );
        $("#charge-form").submit();
        alert("登録が完了しました");
      } else {
        alert("カード情報が正しくありません。");
      }
    });
  });
});