class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name, null: false

      t.timestamps
    end
    
    add_index :authors, :name
  end
end
