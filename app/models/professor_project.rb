class ProfessorProject < ActiveRecord::Base
  belongs_to :professor, foreign_key: :id
  has_many :students
  # attr_accessible :title, :body
end
