{div, img, a, h1, h2, h3, h4, h5, h6, p, b, span, section, article, nav, aside, i, input, form, select, option, textarea, table, th, tr, td, thead, tbody} = React.DOM

window.ProjectCard = React.createClass

  onProjectCardClick: ->
    window.location = Routes.project_path(@props.id)

  render: ->
    div onClick: @onProjectCardClick, className: 'project',
      div className: 'project-title',
        h4 {}, @props.name

      if @props.image["image"]["url"] == null
        img className: 'project-image', src: '/assets/placeholder.png'
      else
        img className: 'project-image', src: @props.image["image"]["url"]

      div className: 'project-details',
        p {}, @props.description

        div className: 'project-activities',
          div className: 'tags',
            a className: 'btn btn-success btn-xs', @props.status

          div className: 'tags',
            a className: 'btn btn-primary btn-xs', 'Fake Tag'

          div className: 'project-favorite',
            i className: 'fa fa-heart'

          div className: 'project-members-count',
            i className: 'fa fa-user'
            span {}, "42"

