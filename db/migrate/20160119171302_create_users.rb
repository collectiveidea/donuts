class CreateUsers < ActiveRecord::Migration
  def change
    enable_extension "uuid-ossp"

    create_table :users, id: :uuid do |t|
      t.string :github_login
      t.string :name
      t.timestamps null: false
    end

    add_index :users, :github_login, unique: true
  end
end
