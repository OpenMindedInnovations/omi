{div, a, h4, ul, li, span, p, textarea, i} = React.DOM

window.IdeaCard = React.createClass
  render: ->
    console.log @props
    div {},
      h4 {},
        a href: Routes.idea_path(@props.id), @props.name
      p {}, @props.description
