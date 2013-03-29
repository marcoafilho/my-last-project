class CreateTriggerUserSubscription < ActiveRecord::Migration
  def up
    execute "
      CREATE OR REPLACE FUNCTION student_subscription_trigger() 
        RETURNS trigger AS
          $$
          DECLARE
            user_id integer;
            message varchar := 'notifications.projects.subscription';
          BEGIN
            SELECT INTO user_id \"professor_projects\".\"id\" FROM \"professor_projects\" WHERE \"professor_projects\".\"project_id\" = NEW.\"project_id\";
            SELECT INTO user_id notify_user(user_id, message);
            RETURN NEW;
          END;
          $$
          LANGUAGE plpgsql;
    
      CREATE TRIGGER student_subscription
        AFTER UPDATE OF project_id ON users
        FOR EACH ROW
          EXECUTE PROCEDURE student_subscription_trigger();
    "
  end

  def down
    execute "
      DROP TRIGGER student_subscription ON users;
      DROP FUNCTION student_subscription_trigger();
    "
  end
end
