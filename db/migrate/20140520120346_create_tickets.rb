class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :price
      t.integer :event_id
      t.date :startdate
      t.date :closedate
      t.integer :maxnumber
      t.text :description

      t.timestamps
    end
  end
end
