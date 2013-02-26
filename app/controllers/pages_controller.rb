class PagesController < ApplicationController
  before_filter :user_resource
  
  def home    
    redirect_to dashboard_path if user_signed_in?
  end

  def about_us
  end
  
  private
  def user_resource
    @user = User.new unless user_signed_in?    
  end
end
