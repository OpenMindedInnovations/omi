if $('.select2-tags').length
  $('.select2-tags').each ->
    # Gets the placeholder, the url for the ajax call
    # and the existing tag list from the input
    placeholder = $(@).data('placeholder')
    url = $(@).data('url')
    saved = $(@).data('saved')
    # ex: saved = [{id: 'css', text: 'css'}, {id: 'ruby', text: 'css'}]

    $('.select2-tags').select2
      # Allows for multiple tags to be input
      multiple: true
      tags: true
      placeholder: placeholder
      minimumInputLength: 1

      # Initializes the autocomplete with the saved data
      initSelection: (element, callback) ->
        saved and callback(saved)

      # Triggers ajax call for tags
      ajax:
        url: url
        dataType: 'json'
        data: (term) ->
          { search: term }
        results: (data) ->
          { results: data }

      formatResult: (item, page) ->
        item.text
      formatSelection: (item, page) ->
        item.text
      formatNoMatches: (term)->
        'No matches, press enter to create a "'+term+'" tag.'

