class CreateProfessorProjects < ActiveRecord::Migration
  def up
    execute "
      CREATE VIEW professor_projects AS
        SELECT users.id AS id, users.name AS name, users.email AS email, 
        projects.id AS project_id, projects.title AS project_title, projects.summary AS project_summary, projects.due_at AS project_due_at
        FROM users 
          INNER JOIN projects ON projects.professor_id = users.id
        WHERE users.type = 'Professor';
    "
  end
  
  def down
    execute "DROP VIEW professor_projects;"
  end
end
