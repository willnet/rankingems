class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(name: params[:name])
    if @category.save
      redirect_to admin_categories_path, notice: 'Successfully created category!'
    else
      render :index
    end
  end

  def update
    @category = Category.friendly.find(params[:id])
    if @category.update(name: params[:category][:name])
      redirect_to admin_categories_path, notice: 'Successfully updated category!'
    else
      render :index
    end
  end
end
