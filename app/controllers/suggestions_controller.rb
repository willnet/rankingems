class SuggestionsController < ApplicationController
  before_action :authenticate

  def create
    @rubygem = Rubygem.friendly.find(params[:rubygem_id])
    valid_params = params.require(:suggestion).permit(:category_name)
    @suggestion = @rubygem.suggestions.build(valid_params)
    @suggestion.user = current_user
    if @suggestion.save
      redirect_to @rubygem, notice: 'successfully made a suggestion!'
    else
      render 'rubygems/edit'
    end
  end
end
