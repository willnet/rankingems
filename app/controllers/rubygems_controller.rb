class RubygemsController < ApplicationController
  before_action :authenticate, only: :edit

  def show
    @rubygem = Rubygem.friendly.find(params[:id])
  end

  def edit
    @rubygem = Rubygem.friendly.find(params[:id])
    @suggestion = @rubygem.suggestions.build
  end
end
