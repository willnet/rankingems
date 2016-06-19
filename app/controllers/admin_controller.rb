class AdminController < Admin::BaseController
  def index
    @suggestions = Suggestion.init.includes(:rubygem, :user)
  end
end
