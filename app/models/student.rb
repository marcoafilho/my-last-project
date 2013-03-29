class Student < User
  belongs_to :project
  
  attr_accessible :project_id
  
  def subscribe(professor_project)
    update_attribute :project_id, professor_project.id
  end
end