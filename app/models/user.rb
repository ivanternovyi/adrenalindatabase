class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
          # :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [ :card_number ]


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
         :role_id, :town_office_id
  # attr_accessible :title, :body

  def role?(role)
    return Role.find_by_name(role.to_s.camelize).id == self.role_id
  end
  def self.find_for_database_authentication(conditions={})
    self.where('card_number = ?', conditions[:card_number]).limit(1).first ||
    self.where('email = ?', conditions[:card_number]).limit(1).first
  end
end
