class Role < ActiveRecord::Base
  ADMIN = "Admin"
  PROFESSOR = "Professor"
  STUDENT = "Student"
  AVAILABLE = [ADMIN, PROFESSOR, STUDENT]
  
  attr_accessible :name
end
