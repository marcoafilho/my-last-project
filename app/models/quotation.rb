class Quotation < ActiveRecord::Base
  attr_accessible :from_page, :reference_id, :text, :to_page
end
