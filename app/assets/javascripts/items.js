jQuery(function($) {
  $(".deleteAction").click( function() {
    current_item_tr = $(this).closest('tr')
    if(confirm('Точно удалить ?'))  {
      $.ajax({
        url: '/items/' + $(current_item_tr).data('item-id'),
        type: 'POST',
        data: { _method: 'DELETE', admin: 1 },
        success: function(result) {
          $(current_item_tr).fadeOut("slow");
          console.log(result);
        }
      })
    }
  })

})