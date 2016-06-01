class Api::CategoriesController < ApplicationController
  def index
    category_names = Category.where('name LIKE ?', "%#{params[:q]}%")
                             .pluck(:name)
    render json: category_names
  end
end
