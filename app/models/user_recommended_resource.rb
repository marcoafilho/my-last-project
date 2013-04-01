class UserRecommendedResource < ActiveRecord::Base
  belongs_to :professor
  belongs_to :student
  belongs_to :resource

  # attr_accessible :title, :body
end
