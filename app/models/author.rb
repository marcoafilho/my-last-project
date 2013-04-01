class Author < ActiveRecord::Base
  has_and_belongs_to_many :resources
  attr_accessible :name
  
  validates :name, presence: true
end
