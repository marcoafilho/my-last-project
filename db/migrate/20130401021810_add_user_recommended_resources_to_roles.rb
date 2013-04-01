class AddUserRecommendedResourcesToRoles < ActiveRecord::Migration
  def up
    execute "GRANT SELECT, INSERT ON user_recommended_resources TO students;"
    execute "GRANT USAGE, SELECT ON SEQUENCE user_recommended_resources_id_seq TO students;"
    
    execute "GRANT SELECT, INSERT ON user_recommended_resources TO professors;"
    execute "GRANT USAGE, SELECT ON SEQUENCE user_recommended_resources_id_seq TO professors;"
  end
  
  def down
    execute "REVOKE SELECT, INSERT ON user_recommended_resources FROM students;"
    execute "REVOKE USAGE, SELECT ON SEQUENCE user_recommended_resources_id_seq FROM students;"
    
    execute "REVOKE SELECT, INSERT ON user_recommended_resources FROM professors;"
    execute "REVOKE USAGE, SELECT ON SEQUENCE user_recommended_resources_id_seq FROM professors;"    
  end
end
