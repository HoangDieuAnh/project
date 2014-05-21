class AddDescriptionToSociety < ActiveRecord::Migration
  def change
  	add_column :societies, :description, :text
  end
end
