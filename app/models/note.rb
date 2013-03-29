class Note < ActiveRecord::Base
  belongs_to :resource
  attr_accessible :text
  
  validates :text, presence: true
end
