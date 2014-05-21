class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :name
      t.integer :regNum
      t.integer :website
      t.boolean :approved

      t.timestamps
    end
  end
end
