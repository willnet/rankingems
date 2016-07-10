class Admin::BaseController < ApplicationController
  before_action :authenticate_admin
  layout 'admin'

  def authenticate_admin
    unless logged_in?
      authenticate
      return
    end
    return if current_user.admin?

    render 'errors/not_found', status: 404
  end
end
