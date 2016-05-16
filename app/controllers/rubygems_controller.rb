class RubygemsController < ApplicationController
  def show
    @rubygem = Rubygem.find(params[:id])
  end
end
