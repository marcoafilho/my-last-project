module ApplicationHelper
  
  def navbar_for(user)
    if current_user && current_user.role.name.eql?("Student")
      render "layouts/navbars/students"
    elsif current_user && current_user.role.name.eql?("Professor")
      render "layouts/navbars/professors"
    else
      render "layouts/navbars/guests"
    end
  end
  
end
