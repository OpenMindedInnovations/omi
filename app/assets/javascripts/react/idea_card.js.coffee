{div, a, h4, ul, li, span, p, textarea, i} = React.DOM

window.IdeaCard = React.createClass
  getInitialState: ->
    upvotes: @props.upvotes
    current_user_upvote: @props.current_user_upvote

  onIdeaCardClick: ->
    window.location = Routes.idea_path(@props.id)

  onUpvote: (e)->
    $.ajax
      url: Routes.upvote_idea_path(@props.id)
      type: 'PUT'
      success: (response)=>
        @setState(upvotes: response.upvotes, current_user_upvote: response.current_user_upvote)
    e.stopPropagation()

  render: ->
    upvote_classes = 'idea-upvote'
    upvote_classes += ' upvoted' if @state.current_user_upvote

    div onClick: @onIdeaCardClick, className: 'idea',
      div className: 'idea-voting',
        a onClick: @onUpvote, className: upvote_classes,
          i className: 'fa fa-caret-up'
        p {}, @state.upvotes
      div className: 'idea-details',
        h4 {}, @props.name
        p {}, @props.description
        div className: 'idea-tags-holder',
          div className: 'idea-tag',
            p: "fake tag"
      div className: 'idea-comments',
        i className: 'fa fa-commenting-o'
