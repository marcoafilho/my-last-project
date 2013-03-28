class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :student
      t.string :title, null: false
      t.integer :progress
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
    add_index :tasks, :student_id
    add_index :tasks, :title
  end
end
