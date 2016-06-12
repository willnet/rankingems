class SearchesController < ApplicationController
  def show
    name = params[:name]
    @categories = Category.where('name LIKE ?', "%#{name}%").limit(30)
    @rubygems = Rubygem.where('name LIKE ?', "%#{name}%").preload(:category).limit(30)
  end
end
