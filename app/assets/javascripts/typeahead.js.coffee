$(document).on 'ready page:load', ->
  $input = $('.typeahead')
  $input.typeahead source: (query, process) ->
    $.get
      url: '/api/categories'
      data:
        q: query
      success: process
