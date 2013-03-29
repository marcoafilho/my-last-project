class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :change_db_connection
  
  def after_sign_in_path_for(resource)
    dashboard_path
  end
  
  private
  def change_db_connection
    return db_connect if self.controller_name == "registrations" && self.action_name == "create"
    
    db_connect
    if current_user
      db_connect username: current_user.db_username, password: current_user.encrypted_password
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
