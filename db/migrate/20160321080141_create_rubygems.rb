class CreateRubygems < ActiveRecord::Migration[5.0]
  def change
    create_table :rubygems do |t|
      t.string :name, null: false
      t.string :version, null: false
      t.string :info
      t.string :authors
      t.string :project_uri
      t.string :gem_uri
      t.string :homepage_uri
      t.string :wiki_uri
      t.string :documentation_uri
      t.string :mailing_list_uri
      t.string :source_code_uri
      t.string :bug_tracker_uri
      t.text :licenses, array: true, default: []
      t.references :category
      t.integer :download_count_for_ranking, null: false, default: 0
      t.timestamps
    end
    add_index :rubygems, :name, unique: true
  end
end
