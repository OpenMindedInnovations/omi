{div, a, h4, ul, li, span, p, textarea, i} = React.DOM

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
    vote_classes = 'idea-upvote'
    vote_classes += ' upvoted' if @state.current_user_vote

    div onClick: @onIdeaCardClick, className: 'idea',
      div className: 'idea-voting',
        a onClick: @onUpvote, className: vote_classes,
          i className: 'fa fa-caret-up'
        p {}, @state.votes
      div className: 'idea-details',
        h4 {}, @props.name
        p {}, @props.description
        div className: 'idea-tags-holder',
          div className: 'idea-tag',
            p: "fake tag"
      div className: 'idea-comments',
        i className: 'fa fa-commenting-o'
