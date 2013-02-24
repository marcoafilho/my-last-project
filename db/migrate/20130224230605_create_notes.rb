class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :reference, null: false
      t.text :text, null: false

      t.timestamps
    end
    add_index :notes, :reference_id
  end
end
