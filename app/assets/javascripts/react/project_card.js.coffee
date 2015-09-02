{div, a, h4, img} = React.DOM

window.ProjectCard = React.createClass

  onProjectCardClick: ->
    window.location = Routes.project_path(@props.id)

  render: ->
    div onClick: @onProjectCardClick, className: 'project',
      div className: 'project-image',
        img src: @props.image["image"]["url"]
      div className: 'project-title',
        h4 {}, @props.name,