class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.references :rubygem, foreign_key: true
      t.references :user, foreign_key: true
      t.string :category, null: false
      t.timestamps
    end
  end
end
