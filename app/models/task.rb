class Task < ActiveRecord::Base
  belongs_to :student
  attr_accessible :ends_at, :progress, :starts_at, :title
end
