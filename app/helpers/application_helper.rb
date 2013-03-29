module ApplicationHelper
  def current_path(path)
    "active" if request.path == path
  end
  
  def current_controller(controller_name)
    "active" if params[:controller] == controller_name
  end
  
  def export
    content_tag :div, "#{t('general.actions.export')}: #{link_to("XML", format: :xml)} | #{link_to("JSON", format: :json)}".html_safe, class: "export"
  end
  
  def navbar_for(user)
    if current_user && current_user.type.eql?("Student")
      render "layouts/navbars/students"
    elsif current_user && current_user.type.eql?("Professor")
      render "layouts/navbars/professors"
    else
      render "layouts/navbars/guests"
    end
  end
  
  def alert_class(type)
    case type
    when :notice then "alert-success"
    when :alert then "alert-error"
    else
      type
    end
  end
end
