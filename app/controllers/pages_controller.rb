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
    render layout: 'application'
  end
end