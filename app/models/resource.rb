class Resource < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :authors
  
  accepts_nested_attributes_for :authors, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true

  attr_accessible :authors_attributes, :file, :file_cache, :publisher, :read_at, :relevance, :title, :type, :year
  
  mount_uploader :file, FileUploader
  
  def autosave_associated_records_for_authors
    self.authors = authors.collect {|a| a = Author.find_or_create_by_name(a.name) }
  end
end
