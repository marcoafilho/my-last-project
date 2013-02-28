class Student < User
  belongs_to :project
  
  attr_accessible :project_id
  
  def subscribe(project)
    update_attribute :project, project
  end
end