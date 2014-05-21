class AddIndex2ToEventPictures < ActiveRecord::Migration
  def self.up
    add_index :events, :society_id
  end
def self.down
    remove_index :events, :column => :society_id
end
end
