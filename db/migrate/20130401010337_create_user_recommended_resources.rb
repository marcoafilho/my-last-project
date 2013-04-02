class CreateUserRecommendedResources < ActiveRecord::Migration
  def change
    create_table :user_recommended_resources do |t|
      t.references :recommender, null: false
      t.references :recommended, null: false
      t.references :resource, null: false

      t.timestamps
    end
    add_index :user_recommended_resources, [:recommender_id, :recommended_id, :resource_id], unique: true, name: :index_user_recommended_resources_on_recommended_res_id 
  end
end
