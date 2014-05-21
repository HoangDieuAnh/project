class AddIndexToEventPictures < ActiveRecord::Migration
 def self.up
    add_index :event_pictures, :event_id
  end
def self.down
    remove_index :event_pictures, :column => :event_id
end
end