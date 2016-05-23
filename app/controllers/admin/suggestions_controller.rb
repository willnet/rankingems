class Admin::SuggestionsController < ApplicationController
  before_action :authenticate_admin

  def update
    suggestion = Suggestion.find(params[:id])
    if params[:accept]
      rubygem = suggestion.rubygem
      ActiveRecord::Base.transaction do
        rubygem.update!(category: suggestion.category)
        suggestion.accepted!
      end
    else
      suggestion.rejected!
    end
    redirect_to admin_index_path
  end
end
