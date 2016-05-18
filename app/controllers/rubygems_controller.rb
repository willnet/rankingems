class RubygemsController < ApplicationController
  before_action :authenticate, only: :edit

  def show
    @rubygem = Rubygem.find(params[:id])
  end

  def edit
    @rubygem = Rubygem.find(params[:id])
    @suggestion = @rubygem.suggestions.build
  end
end
