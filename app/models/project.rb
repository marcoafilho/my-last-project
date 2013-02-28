class Project < ActiveRecord::Base
  belongs_to :professor
  has_many :students
  
  attr_accessible :due_at, :summary, :title
end
