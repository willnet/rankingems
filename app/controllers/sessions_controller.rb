class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to root_path, notice: 'Successfully Sign In!'
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Successfully Sign Out!'
  end

  def failure
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
