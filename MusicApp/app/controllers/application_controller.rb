class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    return false if current_user.nil?
    current_user.session_token == session[:session_token]
  end

  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def redirect_if_logged_in
    redirect_to user_url(current_user) if logged_in?
  end

  def redirect_if_not_logged_in
    redirect_to new_session_path if !logged_in?
  end
end
