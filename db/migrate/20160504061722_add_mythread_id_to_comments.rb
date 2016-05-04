class AddMythreadIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :mythread, index: true, foreign_key: true
  end
end
