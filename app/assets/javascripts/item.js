$(document).on('turbolinks:load', function() {
  $(".de__image-list__box--img").first().addClass("active"); //1枚目の小さい画像をアクティブに変更
  $('.de__image-list__box--img--1').click(function(){ //小さい画像がクリックされたらイベント発火
    image_url = $(this).attr("src"); //クリックされた画像のパスを取得
    $(".de__image__main").attr("src", image_url).hide().fadeIn(); //メイン画像をクリックされた画像に変更
    $(".de__image-list__box--img.active").removeClass("active"); //1枚目の小さい画像のアクティブを無効化
    $(this).parent().addClass("active"); //クリックされた小さな画像をアクティブに変更
  });
  
});