class Ideas::CommentsController < CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Idea.find(params[:idea_id])
    end
end
