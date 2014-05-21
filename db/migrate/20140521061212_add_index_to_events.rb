class AddIndexToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :society_id, :integer
  end
  def self.up
    add_index :events, :society_id
  end
def self.down
    remove_index :events, :column => :society_id
end
end
