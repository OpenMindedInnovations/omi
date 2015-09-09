{div, img, a, h1, h2, h3, h4, h5, h6, p, b, span, section, article, nav, aside, i, input, form, select, option, textarea, table, th, tr, td, thead, tbody} = React.DOM

window.ProjectCard = React.createClass
  getInitialState: ->
    favorites: @props.favorites
    current_user_favorite: @props.current_user_favorite

  onProjectCardClick: ->
    window.location = Routes.project_path(@props.id)

  onFavorite: (e)->
    $.ajax
      url: Routes.toggle_favorite_project_path(@props.id)
      type: 'PUT'
      success: (response)=>
        @setState(favorites: response.favorites, current_user_favorite: response.current_user_favorite)
    e.stopPropagation()

  render: ->
    favorite_classes = 'project-favorite'
    favorite_classes += ' highlighted' if @state.current_user_favorite

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
            console.log(@props.tag_list)
            @props.tag_list.map (tag)=>
              a href: "projects?tags=#{tag}", className: 'btn btn-primary btn-xs',
                tag

          div onClick: @onFavorite, className: favorite_classes,
            i className: 'fa fa-heart'

          div className: 'project-members-count',
            i className: 'fa fa-user'
            span {}, @state.favorites

