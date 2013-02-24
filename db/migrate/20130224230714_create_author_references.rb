class CreateAuthorReferences < ActiveRecord::Migration
  def change
    create_table :author_references do |t|
      t.references :author
      t.references :reference

      t.datetime :created_at
    end
    
    add_index :author_references, :author_id
    add_index :author_references, :reference_id
  end
end
