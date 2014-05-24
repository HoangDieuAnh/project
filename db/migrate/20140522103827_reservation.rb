class Reservation < ActiveRecord::Migration
  def change
  	remove_column :reservations, :integer 
  	change_column :reservations, :ticket_id, :integer
  end
end
