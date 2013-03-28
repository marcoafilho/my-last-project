class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :change_db_connection
  
  def after_sign_in_path_for(resource)
    dashboard_path
  end
  
  private
  def change_db_connection
    db_connect
    if current_user
      if current_user.student?
        db_connect username: "students"
      elsif current_user.professor?
        db_connect username: "professors"
      else
        db_connect username: "guests"
      end 
    else
      db_connect username: "guests"
    end
  end
  
  def db_connect(options = {})
    if options[:username] && options[:password]
      ActiveRecord::Base.establish_connection db_configuration[Rails.env].merge(options)
    elsif options[:username]
      ActiveRecord::Base.establish_connection db_configuration[Rails.env].merge(options)
    else
      ActiveRecord::Base.establish_connection db_configuration[Rails.env]
    end
  end
  
  def db_configuration
    @config ||= Rails.configuration.database_configuration
  end
end
