class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.date :date, null: false
      t.timestamps null: false
    end

    add_index :claims, :user_id
    add_index :claims, :date
  end
end
