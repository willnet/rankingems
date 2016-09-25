class Admin::RubygemsController < Admin::BaseController
  def index
    category = Category.find(params[:category_id]) if params[:category_id]
    if category
      rubygem = Rubygem.where(category: category)
      @category_name = category.name
    else
      rubygem = Rubygem.no_category
      @category_name = 'No Category'
    end
    @rubygems = rubygem.order(download_count_for_ranking: :desc).page(params[:page]).per(20).all
  end

  def show
    @rubygem = Rubygem.friendly.find(params[:id])
  end

  def create
    if rubygem = Rubygem.create_or_update_from_name(params[:name])
      flash[:notice] = "successfully created: #{params[:name]}"
    else
      flash[:alert] = "fail to create: #{params[:name]}"
    end
    redirect_to admin_rubygem_path(rubygem)
  end

  def update
    @rubygem = Rubygem.friendly.find(params[:id])
    if @rubygem.update(params.require(:rubygem).permit(:category_id))
      flash[:notice] = 'Successfully updated!'
    end
    render :show
  end
end
