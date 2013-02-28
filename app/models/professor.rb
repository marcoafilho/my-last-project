class Professor < User
  has_many :projects
  has_many :students, through: :projects, as: :user
end