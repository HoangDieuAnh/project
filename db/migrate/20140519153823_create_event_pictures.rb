class CreateEventPictures < ActiveRecord::Migration
  def change
    create_table :event_pictures do |t|
      t.integer :event_id
      t.binary :picture

      t.timestamps
    end
  end
end
