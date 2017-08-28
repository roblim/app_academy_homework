class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    new_user = User.new(user_params)
    log_in!(new_user) if new_user.save
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :session_token)
  end
end
