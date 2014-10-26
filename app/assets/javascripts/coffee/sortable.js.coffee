$(document).ready ->
  update = ->
    $.post($(this).data('update-url'), $(this).sortable('serialize'))
  $('#stages').sortable(axis: 'y', update: update)
