{div, img, a, h1, h2, h3, h4, h5, h6, p, b, span, section, article, nav, aside, i, input, form, select, option, textarea, table, th, tr, td, thead, tbody} = React.DOM

window.UserCard = React.createClass
  onUserCardClick: ->
    window.location = Routes.user_path(@props.id)

  render: ->
    div onClick: @onUserCardClick, className: 'user',
      div className: 'user-name',
        p {}, @props.first_name + " " + @props.last_name
      div className: 'user-email',
        p {}, @props.email