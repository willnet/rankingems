$(document).on 'ready page:load', ->
  $input = $('.typeahead')
  $input.typeahead
    afterSelect: (item) ->
      $('[name="rubygem[category_id]"]').val(item.id)
    source: (query, process) ->
      $.get
        url: '/api/categories'
        data:
          q: query
        success: process
