class Blogs::CommentsController < CommentsController
  before_action :set_commentable

  private

    def set_commentable
      @commentable = Blog.find(params[:blog_id])
    end
end
