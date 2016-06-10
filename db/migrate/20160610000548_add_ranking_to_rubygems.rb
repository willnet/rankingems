class AddRankingToRubygems < ActiveRecord::Migration[5.0]
  def change
    add_column :rubygems, :ranking, :integer
  end
end
