class Task < ActiveRecord::Base
  belongs_to :user
  attr_accessible :due_at, :duration, :duration_unit, :progress, :title
end
