$(document).on('turbolinks:load', function() {
  $('.card-remove').on('click', function(e){
    e.preventDefault();
    if(!confirm('本当に削除してもよろしいですか？')) {
      return false;
    } else {
      alert('カードの登録が完了しました。')
    }
  });
});