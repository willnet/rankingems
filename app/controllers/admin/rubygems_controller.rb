class Admin::RubygemsController < Admin::BaseController
  def index
    @rubygems = Rubygem.all
  end
end
