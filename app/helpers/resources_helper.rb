module ResourcesHelper
  def display_relevance(relevance)
    display_stars(relevance) + display_stars(5 - relevance, empty: true)
  end
  
  def display_stars(count, options = {})
    count.times.collect do
      if options[:empty]
        content_tag :i, nil, class: "icon-star-empty"
      else
        content_tag :i, nil, class: "icon-star"
      end
    end.join.html_safe
  end
  
  def display_specific_fields(resource, form)
    if resource.type.eql?("Article")
      render "resources/article_fields", f: form
    elsif resource.type.eql?("Book")
      render "resources/book_fields", f: form
    elsif resource.type.eql?("Electronic")
      render "resources/electronic_fields", f: form
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
