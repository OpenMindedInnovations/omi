class ProjectsController < ApplicationController
  before_filter :get_project, :only => [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new 
    @project = Project.new
  end

  def show
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path
    else
      redirect_to new_projects_path
    end
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project), notice: 'Project was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully destroyed.'
  end

  private
    def project_params
      params.require(:project).permit(
        :title,
        :description,
        :image
      )
    end

    def get_project
      @project = Project.find(params[:id])
    end
end