window.addEventListener('DOMContentLoaded', function(){
  let submit = document.getElementById("payment_card_submit-button");
  Payjp.setPublicKey('pk_test_11a1cbafd4b6f03d6a6e018b');
    submit.addEventListener('click', function(e){
    e.preventDefault();

    let card = { //カード入力フォームから情報を取得, フォームのidを記載する
      number: document.getElementById("number").value,
      cvc: document.getElementById("cvc").value,
      exp_month: document.getElementById("card_month").value,
      exp_year: document.getElementById("card_year").value
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

// $(function() {
//   Payjp.setPublicKey('pk_test_11a1cbafd4b6f03d6a6e018b');
//   $("#charge-form").on('click', function(e){
//     e.preventDefault();
//     let card = {
//         number: $('#creditcard_card_number').val(),
//         cvc:$('#creditcard_card_pass').val(),
//         exp_month: $('#creditcard_card_month').val(),
//         exp_year: $('#creditcard_card_year').val()
//     };

//     Payjp.createToken(card, function(status, response) {
//       if (response.error) {
//         $("#charge-form").prop('disabled', false);
//         alert("カード情報が正しくありません。");
//       }
//       else {
//         $(".number").removeAttr("name");
//         $(".cvc").removeAttr("name");
//         $(".exp_month").removeAttr("name");
//         $(".exp_year").removeAttr("name");
//         let token = response.id;
//         $("#card_token").append(`<input type="hidden" name="payjpToken" value=${token}>`);
//         $("#form").get(0).submit();
//         alert("登録が完了しました");
//       }
//     });
//   });
// });
