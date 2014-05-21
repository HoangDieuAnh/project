class AddIndexToTickets < ActiveRecord::Migration
  	def self.up
    add_index :tickets, :event_id
  end
def self.down
    remove_index :tickets, :column => :event_id
end
  end

