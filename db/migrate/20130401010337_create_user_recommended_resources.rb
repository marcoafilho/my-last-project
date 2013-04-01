class CreateUserRecommendedResources < ActiveRecord::Migration
  def change
    create_table :user_recommended_resources do |t|
      t.references :professor, null: false
      t.references :student, null: false
      t.references :resource, null: false

      t.timestamps
    end
    add_index :user_recommended_resources, [:professor_id, :student_id, :resource_id], unique: true, name: :index_user_recommended_resources_on_prof_stud_res_id 
  end
end
