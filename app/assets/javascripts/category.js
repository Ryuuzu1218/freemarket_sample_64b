$(function() {
  function options(category){ // option生成
    let html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリー用html
  function childrenBox(buildHTML){
    let childSelectHtml = '';
    childSelectHtml = `<select class='ex__detail__category__box--select select' id='child-form' name = 'category_id'>
                        <option value="選択してください" data-category="選択してください">選択してください</option>
                          ${buildHTML}
                        <select>`;
    $('.ex__detail__category__box').append(childSelectHtml);
  }
  // 孫カテゴリー用html
  function grandchildrenBox(buildHTML){
    let grandchildSelectHtml = '';
    grandChildSelectHtml = `<select class='ex__detail__category__box--select' id='grandchild-form' name = 'category_id'>
                              <option value="選択してください" data-category="選択してください">"選択してください"</option>
                                ${buildHTML}
                              <select>`;
    $('.ex__detail__category__box').append(grandchildSelectHtml);
  }

  //親カテゴリー選択時イベント
  $('#parent-form').on("change", function() {
    let parentValue = document.getElementById('parent-form').value;
    if (parentValue != '選択してください') { //親の値が初期値でない時
      $.ajax({ //ajax通信
        url: 'category_children',
        type: 'GET',
        data: {
          parent_name: parentValue
        },
        dataType: 'json'
      })
      //成功時
      .done(function(children){
        $('#child-form').remove(); // 子を削除
        $('#grand-child-form').remove(); // 孫を削除
        var buildHTML = '';
        children.forEach(function(child){
          buildHTML += options(child);
        });
        childrenBox(buildHTML);
      })
      .fail(function() {
        alert('カテゴリー取得に失敗しました');
      })
    }else{ // 親が初期値の時
      $('#child-form').remove(); 
      $('#grand-child-form').remove();
    }
  });

  // 子カテゴリー選択時
  $('.ex__detail__category__box').on('change', '#child_form', function(){
    var childId = $('#child-form option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "選択してください"){ //子カテゴリーが初期値でない時
      $.ajax({
        url: 'category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchild-form').remove();
          let buildHTML = '';
          grandchildren.forEach(function(grandchild){
            buildHTML += options(grandchild);
          });
          grandchildrenBox(buildHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchild-form').remove();
    }
  });
});