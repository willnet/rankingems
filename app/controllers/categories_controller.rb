class CategoriesController < ApplicationController
  def show
    @category = Category.friendly.find(params[:id])
    @rubygems = @category.rubygems.order(ranking: :desc)
  end
end
