$(function() {
  $("#parent-form").on("change", function() {
    let parentValue = $('#parent-form').val();
    $.ajax({
      url: 'items/category_search',
      type: "GET",
      data: {
        parent_id: parentValue
      },
      dataType: 'Json'
    })
    .done(function(data)) {
      
    }
  })
})