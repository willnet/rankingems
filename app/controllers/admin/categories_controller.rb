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
      redirect_to :index, notice: 'Successfully created category!'
    else
      render :index
    end
  end
end
