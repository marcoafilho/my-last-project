class SuggestedReference < ActiveRecord::Base
  belongs_to :proposer_id
  belongs_to :proposee_id
  belongs_to :reference
  # attr_accessible :title, :body
end
