$(document).on('turbolinks:load', function() {
  Payjp.setPublicKey('');
  %("#charge-form").on('click', function(e){
    e.preventDefault();
    let card = {
      number: $('#creditcard_card_number').val(),
      cvc:    $('#creditcard_card_pass').val(),
      exp_month: $('#creditcard_card_month').val(),
      exp_year: $('#creditcard_card_year').val(),
    };

    Payjp.createToken(card, function(status, response){
      if (response.error) {
        $("#charge-form").prop('disabled', false);
        alert("カード情報が正しくありません。");
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");
        let token = response.id;
        $("#card_token").appned(`<input type= "hidden" name= "payjpToken" value= ${token}>`);
        $("#form").get(0).submit();
        alert("登録が完了しました");
      }
    });
  });
});