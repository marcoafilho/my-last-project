class CreatePostgresRoles < ActiveRecord::Migration
  def up
    execute "
      DO
      $body$
      BEGIN
        IF NOT EXISTS (SELECT *
          FROM pg_catalog.pg_roles
          WHERE rolname = 'guests') THEN
          CREATE ROLE guests WITH LOGIN;
        END IF;
      END
      $body$
    "
    execute "GRANT SELECT, INSERT ON users TO guests;"
    execute "GRANT USAGE, SELECT ON SEQUENCE users_id_seq TO guests;"
    
    execute "
    DO
    $body$
    BEGIN
      IF NOT EXISTS (SELECT *
        FROM pg_catalog.pg_roles
        WHERE rolname = 'students') THEN
        CREATE ROLE students;
      END IF;
    END
    $body$
    "
    execute "
      GRANT ALL ON users TO students;
      GRANT SELECT, INSERT ON notifications TO students;
      GRANT ALL ON tasks, resources, quotations, notes, authors, authors_resources TO students;
      GRANT SELECT ON professor_projects TO students;
    "
    execute "
      GRANT USAGE, SELECT ON SEQUENCE users_id_seq, notifications_id_seq, 
      tasks_id_seq, resources_id_seq, quotations_id_seq, notes_id_seq, authors_id_seq TO students;
    "
    
    execute "
    DO
    $body$
    BEGIN
      IF NOT EXISTS (SELECT *
        FROM pg_catalog.pg_roles
        WHERE rolname = 'professors') THEN
        CREATE ROLE professors;
      END IF;
    END
    $body$
    "
    execute "
      GRANT ALL ON users TO professors;
      GRANT SELECT, INSERT ON notifications TO professors;
      GRANT ALL ON projects, tasks, resources, quotations, notes, authors, authors_resources TO professors;
    "
    execute "
      GRANT USAGE, SELECT ON SEQUENCE users_id_seq, notifications_id_seq, 
      projects_id_seq, tasks_id_seq, resources_id_seq, quotations_id_seq, notes_id_seq, authors_id_seq TO professors;
    "
  end

  def down
    execute "REVOKE SELECT, INSERT ON users FROM guests;"
    execute "REVOKE USAGE, SELECT ON SEQUENCE users_id_seq FROM guests;"
    execute "DROP ROLE guests;"
    
    execute "REVOKE ALL ON users, notifications, tasks FROM students;"
    execute "
      REVOKE ALL ON users FROM students;
      REVOKE SELECT, INSERT ON notifications FROM students;
      REVOKE ALL ON tasks, resources, quotations, notes, authors, authors_resources FROM students;
      REVOKE SELECT ON professor_projects FROM students;
    "
    execute "
      REVOKE USAGE, SELECT ON SEQUENCE users_id_seq, notifications_id_seq, 
      tasks_id_seq, resources_id_seq, quotations_id_seq, notes_id_seq, authors_id_seq FROM students;
    "
    execute "DROP ROLE students;"

    execute "
      REVOKE ALL ON users FROM professors;
      REVOKE SELECT, INSERT ON notifications FROM professors;
      REVOKE ALL ON projects, tasks, resources, quotations, notes, authors, authors_resources FROM professors;
    "
    execute "
      REVOKE USAGE, SELECT ON SEQUENCE users_id_seq, notifications_id_seq, 
      projects_id_seq, tasks_id_seq, resources_id_seq, quotations_id_seq, notes_id_seq, authors_id_seq FROM professors;
    "
    execute "DROP ROLE professors;" 
  end
end
