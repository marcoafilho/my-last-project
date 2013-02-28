class Resource < ActiveRecord::Base
  belongs_to :user

  attr_accessible :file, :publisher, :read_at, :relevance, :title, :year
  
  mount_uploader :file, FileUploader
end
