class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :eventType
      t.date :eventDate
      t.time :eventTime
      t.string :venue
      t.text :description

      t.timestamps
    end
   
  end
end
