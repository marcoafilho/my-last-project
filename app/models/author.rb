class Author < ActiveRecord::Base
  has_and_belongs_to_many :resources
  attr_accessible :name
  
  # audited associated_with: :resources
  
  validates :name, presence: true
end
