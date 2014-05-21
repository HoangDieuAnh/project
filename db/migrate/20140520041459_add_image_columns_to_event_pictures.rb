class AddImageColumnsToEventPictures < ActiveRecord::Migration
  def self.up
    add_attachment :event_pictures, :image
  end

  def self.down
    remove_attachment :event_pictures, :image
  end
end
