class Student < User
  belongs_to :professor_project, primary_key: :project_id, foreign_key: :id
  has_one :professor, through: :professor_project, foreign_key: :id
  belongs_to :project
  has_many :user_recommended_resources
  has_many :recommended_resources, through: :user_recommended_resources, source: :resource
  
  attr_accessible :project_id
  
  has_many :tasks
  
  def subscribe(professor_project)
    update_attribute :project_id, professor_project.id
  end
end