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
    if(value == "")
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


  //画像投稿で画像を入れたら次のフォームが出現する
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[item_images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image">
                    </img>
                  </div>`;
    return html;}
    const buildImg = (index, url)=> {
      const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">
      <span class="js-remove">削除</span></img>`;
      return html;}
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();
  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
    // fileIndexの先頭の数字を使ってinputを作る
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)}
    $(this).parent().addClass("none")
  });

  $('#previews').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index')
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
    $(`img[data-index="${targetIndex}"]`).remove();
  });
  $(document).ready(function () {
    $("#form-name").validationEngine();
  });
  //カテゴリ１を選択したらカテゴリ２のフォームが出現する。
  
});

