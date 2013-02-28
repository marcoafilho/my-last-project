class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :professor
      t.string :title, null: false
      t.text :summary
      t.date :due_at

      t.timestamps
    end

    add_index :projects, :title
    add_index :projects, :professor_id
  end
end
