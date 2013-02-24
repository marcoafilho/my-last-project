class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.references :user, null: false
      t.integer :relevance
      t.string :title, null: false
      t.string :publisher
      t.integer :year
      t.string :volume
      t.string :issue
      t.integer :isbn
      t.datetime :accessed_at
      t.datetime :read_at

      t.timestamps
    end
    
    add_index :references, :user_id
    add_index :references, :title
  end
end
