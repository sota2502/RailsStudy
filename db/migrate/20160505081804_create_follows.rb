class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user_id, null: false
      t.integer :followed_id, null: false

      t.timestamps null: false
    end

    add_index :follows, [:user_id, :followed_id], unique: true
    add_index :follows, [:followed_id], unique: false
  end
end
