close = -> $('.alert-success').alert('close')

$(document).on 'ready turbolinks:render', ->
  setTimeout close, 5000

$(document).on 'ajax:success', (event) ->
  setTimeout close, 5000
