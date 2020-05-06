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
    const html = `<label data-index="${index}" class="js-file_group sub-image">
                    <input class="js-file none" type="file" 
                    name="item[item_images_attributes][${index}][image]"
                    id="item_images_attributes_${index}_image">
                    <div>画像を設定する</div>
                  </label>`;
    return html;}
    const buildImg = (index, url)=> {
      const html = `<div data-index="${index}" class='image-menu'><img  src="${url}" width="120px" height="120px">
                    <span class="js-remove add">
                      取り消す
                    </span>
                    </div>
     `;
      return html;}
    //editの時、最初に画像投稿フォームを一個付け足す
    // $(".editform").append(buildFileField(('.js-file_group'.length)/2));
  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10,11,12,13,14];
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
    if (img = $(`div[data-index="${targetIndex}"]`).children()[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      // if ($('.image-menu').length<10)
      $('#previews').append(buildImg(targetIndex, blobUrl));
    // fileIndexの先頭の数字を使ってinputを作る
    if($('.sub-image').length <10 )(
    $('#image-box').append(buildFileField(fileIndex[0])));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  }
  });
   //入力フォーム側の削除ボタンを推すと紐付いている画像も消える。
  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index')
    // // 該当indexを振られているチェックボックスを取得する
    // const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // // もしチェックボックスが存在すればチェックを入れる
    // if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    $(this).remove();
    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) ($('#image-box').append(buildFileField(fileIndex[0])));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)

  });

  //画像側の削除ボタンを推すと紐付いている入力フォームも消える。
  $('#previews').on('click', '.js-remove',function(){
  const deleteIndex = $(this).parent().data('index');
  const imgObj = $(this).parent() 
  // 該当indexを振られているチェックボックスを取得する
  const hiddenCheck = $(`input[data-index="${deleteIndex}"].hidden-destroy`);
  // もしチェックボックスが存在すればチェックを入れる
  if (hiddenCheck) hiddenCheck.prop('checked', true);
  imgObj.remove();
  $(this).remove();

  //buildfilefieldごと消せない？

  $(`label[data-index='${deleteIndex}']`).remove();
  $(`input#item_item_images_attributes_${deleteIndex}_id`).remove()

  if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  if ($('.js-file').length == 9 && $('.image-menu').length ==9) $('#image-box').append(buildFileField(fileIndex[0]));
  fileIndex.shift();
  // 末尾の数に1足した数を追加する
  fileIndex.push(fileIndex[fileIndex.length - 1] + 1)

})
 

 $(document).ready(function () {
   let imagecount=$('.js-file_group').length
  $("#form-name").validationEngine();
  if($('.sub-image').length <10 )
    $(".editform").append(buildFileField(imagecount));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
 });

});

