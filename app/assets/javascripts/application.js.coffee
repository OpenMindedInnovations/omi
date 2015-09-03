#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require react
#= require react_ujs
#= require select2
#= require components
#= require particles

if $('#particles-js').length
  particlesJS.load 'particles-js', 'particles-config.json', ->
    console.log('callback - particles.js config loaded')

if $('.blogs-edit').length
  autocomplete_dropdown = $('#blog_tag_list')

  placeholder = autocomplete_dropdown.data('placeholder')
  url = autocomplete_dropdown.data('url')
  saved = autocomplete_dropdown.data('saved')
  multiple: true
  autocomplete_dropdown.select2
    multiple: true
    tags: true
    placeholder: placeholder
    minimumInputLength: 1
    initSelection: (element, callback) ->
      saved and callback(saved)

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

