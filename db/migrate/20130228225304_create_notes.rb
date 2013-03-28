class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :resource
      t.text :text

      t.timestamps
    end
    add_index :notes, :resource_id
  end
end
