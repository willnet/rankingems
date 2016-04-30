class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :github_uid
      t.string :github_name
      t.boolean :admin, default: false, null: false
      t.timestamps
    end
  end
end
