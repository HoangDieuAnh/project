class AddUserIdToSociety < ActiveRecord::Migration
  def change
  	add_column :societies, :user_id, :integer
  	add_index :societies, :user_id
  end
end
