class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user
      t.string :title
      t.datetime :due_at
      t.integer :duration
      t.string :duration_unit
      t.integer :progress

      t.timestamps
    end
    
    add_index :tasks, :user_id
    add_index :tasks, :title
  end
end
