class Api::CategoriesController < ApplicationController
  def index
    category_names = Category.where('name LIKE ?', "%#{params[:q]}%").select(:id, :name)

    render json: category_names.map { |c| { id: c.id, name: c.name } }
  end
end
