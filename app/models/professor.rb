class Professor < User
  has_many :projects
  has_many :students, through: :projects, as: :user
  has_many :user_recommended_resources, foreign_key: :recommended_id
  has_many :recommended_resources, through: :user_recommended_resources, source: :resource
end