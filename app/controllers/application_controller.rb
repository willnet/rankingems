class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def authenticate
    return if logged_in?
    session[:return_path] = request.fullpath
    redirect_to '/auth/github'
  end

  def authenticate_admin
    authenticate
    return if performed?
    unless current_user.admin?
      session[:return_path] = nil # TODO
      render '404' # TODO
    end
  end

  private

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end
end
