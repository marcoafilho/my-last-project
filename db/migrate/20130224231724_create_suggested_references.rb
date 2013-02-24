class CreateSuggestedReferences < ActiveRecord::Migration
  def change
    create_table :suggested_references do |t|
      t.references :proposer, null: false
      t.references :proposee, null: false
      t.references :reference, null: false

      t.datetime :created_at
    end
    
    add_index :suggested_references, [:proposer_id, :proposee_id, :reference_id], unique: true, name: 'suggested_references_proposer_id_reference_id'
  end
end
