class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  def logged_in_user
    return nil if session[:session_token].nil?
    @logged_in_user ||= User.find_by_session_token(session[:session_token])
  end

  def log_in!(user)
    @logged_in_user = user
    session[:session_token] = user.reset_session_token!
    redirect_to user_url(@logged_in_user.id)
  end

  def logged_in?
    logged_in_user == self
  end

  helper_method :logged_in_user
end
