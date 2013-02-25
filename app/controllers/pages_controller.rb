class PagesController < ApplicationController
  def home    
    redirect_to dashboard_path if user_signed_in?
  end

  def about_us
  end

  def blog
  end
end
