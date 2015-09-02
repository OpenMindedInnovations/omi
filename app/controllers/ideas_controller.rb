class IdeasController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_idea, only: [:show, :edit, :update, :destroy, :upvote]

  def index
    @ideas = Idea.all
  end

  def new 
    @idea = Idea.new
  end

  def show
  end

  def edit
  end

  def upvote
    @idea.liked_by current_user
    render json: { upvotes: @idea.votes_for.up.size, current_user_upvote: current_user.voted_up_on?(@idea) }
  end

  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      redirect_to ideas_path
    else
      render new_idea_path
    end
  end

  def update
    if @idea.update(idea_params)
      redirect_to idea_path(@idea), notice: 'Idea was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @idea.destroy
    redirect_to ideas_path, notice: 'Idea was successfully destroyed.'
  end

  private
    def idea_params
      params.require(:idea).permit(
        :user_id,
        :name,
        :description
      )
    end

    def get_idea
      @idea = Idea.find(params[:id])
    end
end
