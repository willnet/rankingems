class RubygemsController < ApplicationController
  before_action :authenticate, only: :edit

  def show
    @rubygem = Rubygem.find(params[:id])
  end

  def edit
    @rubygem = Rubygem.find(params[:id])
  end
end
