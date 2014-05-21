class AddNameToEventPictures < ActiveRecord::Migration
  def change
  	  	add_column :event_pictures, :picturename, :string

  end
end
