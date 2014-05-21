class RemoveColumns < ActiveRecord::Migration
  	def self.up
  remove_column :relationships, :user_id
end
def self.down
  add_column :reationships, :user_id, :integer
end
  
end
