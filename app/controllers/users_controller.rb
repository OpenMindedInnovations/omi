class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    
    if params[:skills].present?
      @users = @users.tagged_with(params[:skills].split(' ').map { |t| t.gsub("-", " ")} )
    end

    if params[:roles].present?
      @users = @users.tagged_with(params[:roles].split(' ').map { |t| t.gsub("-", " ")} )
    end
    
    if params[:sort].present?
      @users= @users.sort_filter(params[:sort])
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to my_account_path(), notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  private
    def user_params
      params[:user][:skill_list] = params[:user][:skill_list].join(',').chomp(",")
      params[:user][:role_list] = params[:user][:role_list].join(',').chomp(",")
      params.require(:user).permit(
        :email,
        :first_name,
        :last_name,
        :about_me,
        :skill_list,
        :role_list
      )
    end
end
