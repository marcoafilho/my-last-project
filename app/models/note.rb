class Note < ActiveRecord::Base
  belongs_to :resource
  attr_accessible :text
  
  audited associated_with: :resource
  
  validates :text, presence: true
end
