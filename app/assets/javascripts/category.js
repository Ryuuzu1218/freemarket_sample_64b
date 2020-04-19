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
    grandchildSelectHtml = `<select class='ex__detail__category__box--select select' id='grandchild-form' name = 'category_id'>
                              <option value="選択してください" data-category="選択してください">"選択してください"</option>
                                ${buildHTML}
                              <select>`;
    $('.ex__detail__category__box').append(grandchildSelectHtml);
    console.log(grandchildSelectHtml)
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
        $('#grandchild-form').remove(); // 孫を削除
        let buildHTML = '';
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
      $('#grandchild-form').remove();
    }
  });

  // 子カテゴリー選択時
  $(document).on('change', '#child-form', function(){
    let childId = $('#child-form option:selected').data('category');
    if (childId != ''){ //子カテゴリーが初期値でない時
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