class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :ticket_id
      t.string :integer
      t.integer :user_id
      t.integer :amount

      t.timestamps
    end
  end
end
