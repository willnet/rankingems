class Admin::RubygemsController < Admin::BaseController
  def index
    @rubygems = Rubygem.page(params[:page]).per(20).all
  end

  def show
    @rubygem = Rubygem.friendly.find(params[:id])
  end
end
