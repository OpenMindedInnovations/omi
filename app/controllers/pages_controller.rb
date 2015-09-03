class PagesController < ApplicationController
  layout 'landing'
  before_filter :authenticate_user!, only: :dashboard

  def home
  end

  def about 
  end

  def admin
    @projects = Project.all
  end

  def dashboard
    @ideas = Idea.all.order(cached_votes_up: :desc)
    @projects = Project.all.order(created_at: :desc)
    render layout: 'application'
  end
end