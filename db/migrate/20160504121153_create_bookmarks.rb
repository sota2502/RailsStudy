class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references :user, index: true, null: false, foreign_key: true
      t.references :mythread, index: true, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
