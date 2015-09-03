{div, a, h4, img, p} = React.DOM

window.UserCard = React.createClass
  onUserCardClick: ->
    window.location = Routes.user_path(@props.id)

  render: ->
    div onClick: @onUserCardClick, className: 'user',
      div className: 'user-name',
        p {}, @props.first_name + " " + @props.last_name,
      div className: 'user-email',
        p {}, @props.email,