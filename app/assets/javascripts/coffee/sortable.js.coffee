$(document).ready ->
  update = ->
    $.post($(this).data('update-url'), $(this).sortable('serialize')).done ->
      location.reload()
  $('#stages').sortable(axis: 'y', update: update)
