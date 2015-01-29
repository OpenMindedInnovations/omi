class PagesController < ApplicationController
  def about
    
  end

  def admin
    @projects = Project.all
  end

  def student_registration
  end

  def helper_registration
  end

  def project_registration
  end
end