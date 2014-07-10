class PagesController < ApplicationController
  def about
    
  end

  def admin
    @projects = Project.all
  end
end