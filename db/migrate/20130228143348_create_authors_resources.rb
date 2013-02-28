class CreateAuthorsResources < ActiveRecord::Migration
  def up
    create_table :authors_resources, id: false do |t|
      t.references :author
      t.references :resource
    
      t.datetime :created_at
    end
    
    execute "ALTER TABLE authors_resources ADD PRIMARY KEY (author_id, resource_id)"
  end
  
  def down
    drop_table :authors_resources
  end
end
