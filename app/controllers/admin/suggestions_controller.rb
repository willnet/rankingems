class Admin::SuggestionsController < Admin::BaseController
  def index
    @suggestions = Suggestion.init.includes(:rubygem, :user)
  end

  def update
    suggestion = Suggestion.find(params[:id])
    if params[:accept]
      rubygem = suggestion.rubygem
      ActiveRecord::Base.transaction do
        category = Category.find_or_create_by!(name: suggestion.category_name)
        rubygem.update!(category: category)
        suggestion.accepted!
      end
    else
      suggestion.rejected!
    end
    redirect_to admin_index_path
  end
end
