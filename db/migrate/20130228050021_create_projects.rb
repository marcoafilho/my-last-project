class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references :user
      t.string :title
      t.text :summary
      t.datetime :due_at

      t.timestamps
    end
    add_index :projects, :user_id
  end
end
