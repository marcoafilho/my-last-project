class Quotation < ActiveRecord::Base
  belongs_to :resource
  attr_accessible :from_page, :text, :to_page
end
