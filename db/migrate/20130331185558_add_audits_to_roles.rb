class AddAuditsToRoles < ActiveRecord::Migration
  def up
    execute "GRANT SELECT, INSERT ON audits TO students;"
    execute "GRANT USAGE, SELECT ON SEQUENCE audits_id_seq TO students;"
    
    execute "GRANT SELECT, INSERT ON audits TO professors;"
    execute "GRANT USAGE, SELECT ON SEQUENCE audits_id_seq TO professors;"
  end
  
  def down
    execute "REVOKE SELECT, INSERT ON audits FROM students;"
    execute "REVOKE USAGE, SELECT ON SEQUENCE audits_id_seq FROM students;"
    
    execute "REVOKE SELECT, INSERT ON audits FROM professors;"
    execute "REVOKE USAGE, SELECT ON SEQUENCE audits_id_seq FROM professors;"    
  end
end
