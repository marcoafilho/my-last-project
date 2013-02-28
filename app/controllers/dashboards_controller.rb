class DashboardsController < ApplicationController
  def show
    if current_user.professor?
      load_professor_resources
    elsif current_user.student?
      load_student_resources
    end
  end
  
  private
  def load_professor_resources
    @notifications = current_user.notifications.order("created_at DESC")
    @students = current_user.students.order("name")
  end
  
  def load_student_resources
    @notifications = current_user.notifications.order("created_at DESC")
  end
end
