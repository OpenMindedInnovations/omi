{div, img, a, h1, h2, h3, h4, h5, h6, p, b, span, section, article, nav, aside, i, input, form, select, option, textarea, table, th, tr, td, thead, tbody} = React.DOM

window.IdeaCard = React.createClass
  getInitialState: ->
    votes: @props.votes
    current_user_vote: @props.current_user_vote

  onIdeaCardClick: ->
    window.location = Routes.idea_path(@props.id)

  onUpvote: (e)->
    $.ajax
      url: Routes.toggle_vote_idea_path(@props.id)
      type: 'PUT'
      success: (response)=>
        @setState(votes: response.votes, current_user_vote: response.current_user_vote)
    e.stopPropagation()

  render: ->
    vote_classes = 'fa fa-caret-up upvote-icon'
    vote_classes += ' upvoted' if @state.current_user_vote

    div onClick: @onIdeaCardClick, className: 'idea',
      div onClick: @onUpvote, className: 'idea-voting',
        i className: vote_classes
        p {}, @state.votes

      div className: 'idea-details',
        h4 {}, @props.name
        p {}, @props.description
        div className: 'tags',
          a className: 'btn btn-primary btn-xs', 'Fake Tag'

      div className: 'idea-comments',
        i className: 'fa fa-commenting-o'
