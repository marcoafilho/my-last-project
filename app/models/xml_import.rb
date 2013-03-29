require 'nokogiri'

class XmlImport
  attr_accessor :file_name, :resource
  
  def initialize(attrs = {})
    @file_name = attrs[:file_name]
  end
  
  def destroy
    File.delete(Rails.root.join("public", "imports", @file_name))
  end
  
  def import(user)
    doc = Nokogiri::XML(File.open(Rails.root.join("public", "imports", @file_name), 'r'))
    doc.css('objects').each do |objects|
      objects.css('object').each do |object|
        @resource = build_resource(user, object)
        @resource.save
      end
    end    
  end
  
  def build_resource(user, object)
    resource = user.resources.new
    resource.authors_attributes = object.css('authors_attributes author').each_with_index.inject({}) do |hash, (author, index)|
      hash.merge(index => { name: author.at_css('name').content.strip }) if author.at_css('name')
    end
    resource.accessed_at = object.at_css('accessed_at').content if object.at_css('accessed_at')
    resource.isbn = object.at_css('isbn').content if object.at_css('isbn')
    resource.issue = object.at_css('issue').content if object.at_css('issue')
    resource.publisher = object.at_css('publisher').content if object.at_css('publisher')
    resource.relevance = object.at_css('relevance').content if object.at_css('relevance')
    resource.title = object.at_css('title').content if object.at_css('title')
    resource.type = object.at_css('type').content if object.at_css('type')
    resource.volume = object.at_css('volume').content if object.at_css('volume')
    resource.year = object.at_css('year').content if object.at_css('year')
    
    resource
  end
end