class CreateAuthorsReferences < ActiveRecord::Migration
  def up
    # create_table :authors_references, id: false do |t|
    #   t.references :author
    #   t.references :reference
    # 
    #   t.datetime :created_at
    # end
    # 
    # execute "ALTER TABLE authors_references ADD PRIMARY KEY (author_id, reference_id)"
  end
  
  def down
    # drop_table :authors_references
  end
end
