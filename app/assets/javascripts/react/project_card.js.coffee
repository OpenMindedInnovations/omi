{div, a, h4, img, p} = React.DOM

window.ProjectCard = React.createClass

  onProjectCardClick: ->
    window.location = Routes.project_path(@props.id)

  render: ->
    div onClick: @onProjectCardClick, className: 'project',
      div className: 'project-image',
      if @props.image["image"]["url"] == null
        img src: '/images/placeholder.png'
      else
        img src: @props.image["image"]["url"]
      div className: 'project-title',
        h4 {}, @props.name,
      div className: 'project-description',
        p {}, @props.description,
      div className: 'project-collaborators',
      div className: 'project-activities',
        div className: 'project-status',
          p: "active",
        div className: 'project-members-count',
          div className: 'fa fa-user',
            p: "42",
        div className: 'project-favorite',
          div className: 'fa fa-heart-o',
        div className: 'project-tags',
          div className: 'project-tag',
            p: "fake tag"