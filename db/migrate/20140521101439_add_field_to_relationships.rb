class AddFieldToRelationships < ActiveRecord::Migration
  def change
  	add_column :relationships, :position, :string
  	add_column :relationships, :firstname, :string
  	add_column :relationships, :middlename, :string
  	add_column :relationships, :lastname, :string
  	add_column :relationships, :email, :string
  	add_column :relationships, :phone, :integer
  end
end
