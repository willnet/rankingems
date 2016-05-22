class AdminController < ApplicationController
  before_action :authenticate_admin

  def index
    @suggestions = Suggestion.init.includes(:rubygem, :user)
  end
end
