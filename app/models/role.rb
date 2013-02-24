class Role < ActiveRecord::Base
  ADMIN = "Admin"
  AVAILABLE = [ADMIN, "Professor", "Student"]
  
  attr_accessible :name
end
