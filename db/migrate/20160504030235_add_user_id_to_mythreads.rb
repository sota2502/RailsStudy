class AddUserIdToMythreads < ActiveRecord::Migration
  def change
    add_reference :mythreads, :user, index: true, foreign_key: true, null: false
  end
end
