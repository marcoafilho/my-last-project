class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user, null: false
      t.string :name, null: false
      t.text :summary
      t.datetime :due_at

      t.timestamps
    end
    
    add_index :projects, :user_id
    add_index :projects, :name
  end
end
