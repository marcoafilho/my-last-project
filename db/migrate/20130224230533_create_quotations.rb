class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.references :reference, null: false
      t.text :text, null: false
      t.integer :from_page
      t.integer :to_page

      t.timestamps
    end
    
    add_index :quotations, :reference_id
  end
end
