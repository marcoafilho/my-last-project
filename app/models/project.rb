class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :due_at, :summary, :title
end
