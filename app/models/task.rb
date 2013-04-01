class Task < ActiveRecord::Base
  belongs_to :student
  attr_accessible :ends_at, :progress, :starts_at, :student_id, :title
  
  scope :done, where(progress: 100)
  scope :in_progress, where('progress < 100')
  
  validates :title, presence: true
end
