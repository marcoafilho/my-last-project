module ResourcesHelper
  def display_specific_fields(resource, form)
    if resource.type.eql?("Article")
      render "article_fields", f: form
    elsif resource.type.eql?("Book")
      render "book_fields", f: form
    elsif resource.type.eql?("Electronic")
      render "electronic_fields", f: form
    end
  end
  
  def display_authors(resource)
    if resource.authors.size > 3
      resource.authors.first.name + " et al."
    else
      resource.authors.collect(&:name).join(', ')
    end
  end
end
