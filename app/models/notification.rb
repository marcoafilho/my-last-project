class Notification < ActiveRecord::Base
  attr_accessible :message
  
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, presence: true
end
