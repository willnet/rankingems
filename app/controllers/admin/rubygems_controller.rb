class Admin::RubygemsController < Admin::BaseController
  def index
    @rubygems = Rubygem.page(params[:page]).per(20).all
  end
end
