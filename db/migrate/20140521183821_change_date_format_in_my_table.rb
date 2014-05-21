class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def change
  	   change_column :societies, :website, :string

  end
end
