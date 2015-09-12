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
          console.log data
          { results: data }

      createSearchChoice: (term, data) ->
        if $(data).filter((->
            @text.localeCompare(term) == 0
          )).length == 0
          return {
            id: term
            text: term
          }
        return

      formatResult: (item, page) ->
        item.text
      formatSelection: (item, page) ->
        item.text
      formatNoMatches: (term)->
        'No matches, press enter to create a "'+term+'" tag.'


    $('.select2-tags').on 'change', (e)->
      console.log e

    # $('.select2-search-field > input.select2-input').on 'keyup', (e) ->
    #   addToList $(this).val() if e.keyCode == 13

    # $('.select2-input').on 'keydown', (e) ->
    #   console.log 'KEEYYYYED'
    #   if e.keyCode == 13
    #     $('#select2-drop-mask').click()
    #     $('#name').focus()
    #     e.preventDefault()
    #   return


