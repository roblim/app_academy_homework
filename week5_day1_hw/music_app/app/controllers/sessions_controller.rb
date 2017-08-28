class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:email], user_params[:password])
    return flash[:errors] = "Incorrect username or password!" if user.nil?
    log_in!(user)
  end

  def destroy
    logged_in_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
