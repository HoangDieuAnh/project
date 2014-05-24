class AddIndexForReservation < ActiveRecord::Migration
  def change
    add_index :reservations, :ticket_id
    add_index :reservations, :user_id
  end
end
