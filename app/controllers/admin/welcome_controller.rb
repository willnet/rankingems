class Admin::WelcomeController < Admin::BaseController
  def index
    @suggestions = Suggestion.init.includes(:rubygem, :user)
  end
end
