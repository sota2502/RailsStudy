class CreateMythreads < ActiveRecord::Migration
  def change
    create_table :mythreads do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
