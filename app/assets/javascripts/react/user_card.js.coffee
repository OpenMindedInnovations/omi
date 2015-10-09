{div, img, a, h1, h2, h3, h4, h5, h6, p, b, span, section, article, nav, aside, i, input, form, select, option, textarea, table, th, tr, td, thead, tbody} = React.DOM

window.UserCard = React.createClass
  onUserCardClick: ->
    window.location = Routes.user_path(@props.id)

  render: ->
    div onClick: @onUserCardClick, className: 'user'
      img className: 'user-avatar', src: @props.avatar["avatar"]["url"]
      div className: 'user-name',
        p {}, @props.first_name + " " + @props.last_name
#      div className: 'user-email',
#        p {}, @props.email
      div className: 'user-skils',
        p {}, @props.skill_list.map (skill)=>
          a href: Routes.users_path(skills: "#{skill}"), className: 'btn btn-primary btn-xs',
            skill.replace(/\-/g, " ")
      div className: 'user-roles',
        p {}, @props.role_list.map (role)=>
          a href: Routes.users_path(roles: "#{role}"), className: 'btn btn-success btn-xs',
            role.replace(/\-/g, " ")
