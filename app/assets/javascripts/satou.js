$(document).on('turbolinks:load', function() {
  //入力フォームが空白の時、エラーが出るようにする
  $('input.forms').on('blur',function()
  {
    let error;
    let value = $(this).val();
    if(value == "")
    {
      error = true;
    }
    else if(!value.match(/[^\s\t]/))
    {
      error = true;
    }
    if(error)
    {
      //エラー時の処理
    
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('div.bemust').length)
      {
        //メッセージを後ろに追加
        $(this).after('<div class = "bemust">こちらの入力は必須です！</div>');
        $(this).closest('.forms').addClass("arround_red")
      }
    }
    else
    {
      //エラーじゃないのにメッセージがあったら
      if($(this).nextAll('div.bemust').length)
      {
        //消す
        $(this).nextAll('div.bemust').remove();
        $(this).closest('.forms').removeClass("arround_red")
      }
    }
  });

  //セレクトボックスが「選択してください」だとエラーが表示
  $('select').change(function()
  {
    let error;
    let value = $(this).val();
    if(value == "初期")
    {
      error = true;
    }
    if(error)
    {
      //エラー時の処理
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('div.bemust').length)
      {
        //メッセージを後ろに追加
        $(this).after('<div class = "bemust">こちらの選択は必須です！</div>');
        $(this).closest('.select').addClass("arround_red")
      }
    }
    else
    {
      //エラーじゃないのにメッセージがあったら
      if($(this).nextAll('div.bemust').length)
      {
        //消す
        $(this).nextAll('div.bemust').remove();
        $(this).closest('.select').removeClass("arround_red")
      }
    }
  });

  //金額入力フォームが空白の時、金額指定で入るようにする
  $('input.money_form').on('blur',function()
  {
    let error;
    let value = $(this).val();
    if(value == "")
    {
      error = true;
    }
    else if(!value.match(/[^\s\t]/))
    {
      error = true;
    }
    if(error)
    {
      //エラー時の処理
    
      //エラーで、エラーメッセージがなかったら
      if(!$(this).nextAll('div.bemust').length)
      {
        //メッセージを後ろに追加
        $(this).after('<div class = "bemust">¥300~¥10,000,000で入力してください！！</div>');
        $(this).closest('.money_form').addClass("arround_red")
      }
    }
    else
    {
      //エラーじゃないのにメッセージがあったら
      if($(this).nextAll('div.bemust').length)
      {
        //消す
        $(this).nextAll('div.bemust').remove();
        $(this).closest('.money_form').removeClass("arround_red")
      }
    }
  });
//金額を入力すると手数料と利益が自動計算される。
  $('input.money_form').on('keyup',function()
  {var money=$(".money_form").val()
   var fee=Math.floor(money*0.1)
   var mouke=(money-fee)
   $(".ex__price__fee--real-fee").text("¥"+fee.toLocaleString())
   $(".ex__price__benefit--mouke").text("¥"+mouke.toLocaleString())
  })

  //商品紹介のフォームの文字数を数える
  $(".text-duce").on("keyup", function() {
    //紹介文フォームでキーが打ち込まれたら紹介文の文字数をcountに設定。
  var count = $(this).val().replace(/\n/g, "改行").length;
    //文字数の所をフォームの文字数に変換する
  $(".ex__intro__strcount").text(count + "/1,000");
  //1000文字超えたらエラーが出る。
  if (count > 1000) {
    $(".ex__intro__strcount").css("color","red");
    if(!$(this).nextAll('div.over').length)
    {
      //メッセージを後ろに追加
      $(this).after('<div class  = "over">文字数をオーバーしています</div>');
    }
  } else {
    $(".ex__intro__strcount").css("color","black");
    if($(this).nextAll('div.over').length)
      {
        //消す
        $(this).nextAll('div.over').remove();
      }
  }
  //文字数０だとエラーが出る。
  if (count == 0) {
    if(!$(this).nextAll('div.bemust').length)
    {
      //メッセージを後ろに追加
      $(this).after('<div class = "bemust">こちらの入力は必須です！</div>');
      $(this).closest('.forms').addClass("arround_red")
    }
  }
  else
  {
    //エラーじゃないのにメッセージがあったら
    if($(this).nextAll('div.bemust').length)
    {
      //消す
      $(this).nextAll('div.bemust').remove();
      $(this).closest('.forms').removeClass("arround_red")
  }}
  })


});