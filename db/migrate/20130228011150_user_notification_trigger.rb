class UserNotificationTrigger < ActiveRecord::Migration
  def up
    # execute "
    #   CREATE OR REPLACE FUNCTION student_subscription_trigger() 
    #     RETURNS trigger AS
    #       $$
    #       DECLARE
    #         user_id integer;
    #         message varchar := 'projects.subscription.professor.notification';
    #       BEGIN
    #         SELECT INTO user_id \"projects\".\"user_id\" FROM \"projects\" WHERE \"projects\".\"id\" = NEW.\"project_id\";
    #         SELECT INTO user_id notify_user(user_id, message);
    #         RETURN NEW;
    #       END;
    #       $$
    #       LANGUAGE plpgsql;
    # 
    #   CREATE TRIGGER student_subscription
    #     AFTER UPDATE OF project_id ON users
    #     FOR EACH ROW
    #       EXECUTE PROCEDURE student_subscription_trigger();
    # "
  end

  def down
    # execute "
    #   DROP TRIGGER student_subscription ON users;
    #   DROP FUNCTION student_subscription_trigger();
    # "
  end
end
