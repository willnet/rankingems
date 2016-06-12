class AddSlugToRubygems < ActiveRecord::Migration[5.0]
  def change
    add_column :rubygems, :slug, :string
    add_index :rubygems, :slug, unique: true
  end
end
