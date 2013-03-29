class Resource < ActiveRecord::Base
  AVAILABLE_RESOURCES = ["Article", "Book", "Conference", "Electronic"]
  
  belongs_to :user
  has_and_belongs_to_many :authors
  has_many :quotations
  has_many :notes
  
  accepts_nested_attributes_for :authors, reject_if: lambda { |a| a[:name].blank? }, allow_destroy: true
  accepts_nested_attributes_for :quotations, reject_if: lambda { |a| a[:text].blank? }, allow_destroy: true
  accepts_nested_attributes_for :notes, reject_if: lambda { |a| a[:text].blank? }, allow_destroy: true

  attr_accessible :file, :file_cache, :publisher, :read_at, :relevance, :title, :type, :year
  attr_accessible :authors_attributes, :quotations_attributes, :notes_attributes
  attr_accessible :issue, :volume
  attr_accessible :isbn
  attr_accessible :accessed_at
  
  validates :title, presence: true
  validates :type, presence: true
  
  mount_uploader :file, FileUploader
  
  def autosave_associated_records_for_authors
    self.authors = authors.collect {|a| a = Author.find_or_create_by_name(a.name) }
  end
  
  def to_xml(options = {})
    super(options.merge!(methods: :authors))
  end
end
