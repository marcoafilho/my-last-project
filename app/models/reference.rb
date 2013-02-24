class Reference < ActiveRecord::Base
  belongs_to :user
  attr_accessible :accessed_at, :isbn, :issue, :publisher, :read_at, :relevance, :title, :volume, :year
end
