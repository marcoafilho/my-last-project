class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.references :user

      t.integer :relevance, default: 0
      t.string :title, null: false
      t.string :type, null: false

      t.string :publisher, default: ""
      t.string :year, default: ""
      t.string :file
      
      # Article specific
      t.string :issue, default: ""
      t.string :volume, default: ""
      
      # Book specific
      t.integer :isbn

      # Electronics specific
      t.date :accessed_at

      t.date :read_at
      t.timestamps
    end
    
    add_index :resources, :user_id
    add_index :resources, :title
  end
end
