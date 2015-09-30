source = new EventSource('/event')
source.addEventListener 'message', (event) ->
  message = $.parseJSON(event.data)
  $('#chatbox').append($('<li>').text("#{message.full_name} - #{message.body.created_at}: #{message.body.content}"))
