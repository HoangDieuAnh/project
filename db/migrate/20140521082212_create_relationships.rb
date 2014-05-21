class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :society_id
      t.integer :user_id
      t.string :role

      t.timestamps
    end
    add_index :relationships, :society_id
    add_index :relationships, :user_id
  end
end
