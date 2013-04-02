class UserRecommendedResource < ActiveRecord::Base
  belongs_to :professor, foreign_key: :recommender_id
  belongs_to :student, foreign_key: :recommender_id
  belongs_to :resource

  # attr_accessible :title, :body
end
