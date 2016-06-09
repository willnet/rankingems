class CategoriesController < ApplicationController
  def show
    @category = Category.friendly.find(params[:id])
    @rubygems = @category.rubygems.order(download_count_for_ranking: :desc)
  end
end
