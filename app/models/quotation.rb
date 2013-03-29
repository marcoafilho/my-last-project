class Quotation < ActiveRecord::Base
  belongs_to :resource
  attr_accessible :from_page, :text, :to_page
  
  validates :text, presence: true
end
