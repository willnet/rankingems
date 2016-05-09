class CreateDownloads < ActiveRecord::Migration[5.0]
  def change
    create_table :downloads do |t|
      t.references :rubygem, null: false
      t.integer :count, default: 0, null: false
      t.timestamps
    end
  end
end
