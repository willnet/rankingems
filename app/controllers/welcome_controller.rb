class WelcomeController < ApplicationController
  def index
    @categories = Category.order(:name)
  end
end
