class Note < ActiveRecord::Base
  belongs_to :reference
  attr_accessible :text
end
