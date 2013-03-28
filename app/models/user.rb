class User < ActiveRecord::Base
  AVAILABLE_ROLES = ["Professor", "Student"]
  
  has_many :notifications
  has_many :resources
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  after_create :create_db_user

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :type
  
  validates :name, presence: true
  validates :type, presence: true
  
  User.class_eval do
    User::AVAILABLE_ROLES.each do |role|
      define_method :"#{role.downcase}?" do
        type.eql? role
      end
    end
  end
  
  private
  def create_db_user
    execute ""
  end
end
