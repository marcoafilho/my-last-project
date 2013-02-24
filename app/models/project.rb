class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :due_at, :name, :summary
end
