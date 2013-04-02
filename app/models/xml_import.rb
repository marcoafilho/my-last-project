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
    doc.xpath('//objects').each do |objects|
      objects.xpath('object').each do |object|
        @resource = build_resource(user, object)
        @resource.save
      end
    end    
  end
  
  def build_resource(user, object)
    resource = user.resources.new
    resource.authors_attributes = object.xpath('authors_attributes/author').each_with_index.inject({}) do |hash, (author, index)|
      hash.merge(index => { name: author.at_xpath('name').content.strip }) if author.at_xpath('name')
    end
    
    resource.quotations_attributes = object.xpath('quotations_attributes/quotation').each_with_index.inject({}) do |hash, (quotation, index)|
      hash.merge(index => { 
        text: quotation.at_xpath('text').content.strip, 
        from_page: (quotation.at_xpath('from_page').content if quotation.at_xpath('from_page')), 
        to_page: (quotation.at_xpath('to_page').content if quotation.at_xpath('to_page')) }
      ) if quotation.at_xpath('text')
    end

    resource.notes_attributes = object.xpath('notes_attributes/note').each_with_index.inject({}) do |hash, (note, index)|
      hash.merge(index => { text: note.at_xpath('text').content.strip }) if note.at_xpath('text')
    end
    
    resource.accessed_at = object.at_xpath('accessed_at').content if object.at_xpath('accessed_at')
    resource.isbn = object.at_xpath('isbn').content if object.at_xpath('isbn')
    resource.issue = object.at_xpath('issue').content if object.at_xpath('issue')
    resource.publisher = object.at_xpath('publisher').content if object.at_xpath('publisher')
    resource.relevance = object.at_xpath('relevance').content if object.at_xpath('relevance')
    resource.title = object.at_xpath('title').content if object.at_xpath('title')
    resource.type = object.at_xpath('type').content if object.at_xpath('type')
    resource.volume = object.at_xpath('volume').content if object.at_xpath('volume')
    resource.year = object.at_xpath('year').content if object.at_xpath('year')
    
    resource
  end
end