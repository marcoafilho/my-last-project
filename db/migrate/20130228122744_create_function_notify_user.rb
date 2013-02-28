class CreateFunctionNotifyUser < ActiveRecord::Migration
  def up
    execute "
      CREATE FUNCTION notify_user(int, varchar)
        RETURNS void AS 
          $$
            INSERT INTO notifications (user_id, message, created_at) VALUES ($1, $2, now());
          $$
        LANGUAGE SQL;
    "
  end

  def down
    execute "DROP FUNCTION notify_user(int, varchar)"
  end
end
