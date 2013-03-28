class CreateQuotations < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.references :resource
      t.text :text
      t.integer :from_page
      t.integer :to_page

      t.timestamps
    end

    add_index :quotations, :resource_id
  end
end
