class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
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
      params.require(:user).permit(
        :email,
        :first_name,
        :last_name
      )
    end
end