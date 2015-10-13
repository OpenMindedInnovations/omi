class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:work, :products, :work_show, :products_show]
  before_filter :get_project, only: [:show, :edit, :update, :destroy, :work_show, :products_show, :toggle_favorite]

  def index
    @projects = Project.all

    if params[:tags].present?
      @projects = @projects.tagged_with(params[:tags].split(' ').map { |t| t.gsub("-", " ")} )
    end

    if params[:status].present?
      @projects = @projects.status_filter(params[:status])
    end

    if params[:sort].present?
      @projects = @projects.sort_filter(params[:sort])
    end

    @projects = @projects.paginate(page: params[:page], per_page: 6)
  end

  def work
    @projects = Project.with_category(:contract).where(featured: true)
    render layout: 'landing'
  end

  def work_show
    @link = work_path
    render layout: 'landing', template: 'projects/landing_project_show'
  end

  def products
    @projects = Project.with_category(:product).where(featured: true)
    render layout: 'landing'
  end

  def products_show
    @link = products_path
    render layout: 'landing', template: 'projects/landing_project_show'
  end

  def new 
    @project = Project.new
    @project.teams.build
  end

  def show
  end

  def edit
  end

  def toggle_favorite
    if @project.marked_as?(:favorite, by: current_user)
      @project.unmark :favorite, by: current_user
      @project.touch
      render json: { favorites: @project.users_have_marked_as_favorite.size, current_user_favorite: @project.marked_as?(:favorite, by: current_user) }
    else
      current_user.favorite_projects << @project
      @project.touch
      render json: { favorites: @project.users_have_marked_as_favorite.size, current_user_favorite: @project.marked_as?(:favorite, by: current_user) }
    end
  end

  def create
    params
    @project = Project.new(project_params)
    @project.teams.build
    @project.owner = current_user

    if @project.save
      @project.users << User.find(params[:teams_attributes][:users_attributes][:search_name].split(','))
      redirect_to projects_path
    else
      render new_project_path
    end
  end

  def update
    @project.users.clear if params[:teams_attributes][:users_attributes][:search_name].present?
    @project.users << User.find(params[:teams_attributes][:users_attributes][:search_name].split(','))
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
        :id,
        :name,
        :description,
        :category,
        :status,
        :tag_list,
        :image,
        :featured,
        teams_attributes: [:id, :project_id, :user_id,
          users_attributes: [:id, :email, :first_name, :last_name, :search_name]
        ] 
      )
    end

    def get_project
      @project = Project.find(params[:id])
    end
end
