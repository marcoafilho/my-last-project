class Project < ActiveRecord::Base
  belongs_to :user
  has_many :users
  
  attr_accessible :due_at, :name, :summary
  
  validates :name, presence: true
end
