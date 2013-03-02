class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
          # :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [ :auth_field ]

  attr_accessor :auth_field

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :auth_field, :password, :password_confirmation, 
          :remember_me, :role_id, :town_office_id, :towns, :town_ids, 
          :user_detail, :user_detail_attributes, :phones_attributes,
          :contact_attributes, :card_infos_attributes

  # attr_accessible :title, :body
  has_many :admin_user_to_towns, dependent: :destroy
  has_many :towns, through: :admin_user_to_towns

  has_one :user_detail, dependent: :destroy
  accepts_nested_attributes_for :user_detail
  # validates_associated :user_detail

  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones, allow_destroy: true, reject_if: lambda {|attrs| attrs.all? {|key, value| value.blank?}}

  has_one :contact, dependent: :destroy
  accepts_nested_attributes_for :contact

  has_many :card_infos, dependent: :destroy
  accepts_nested_attributes_for :card_infos

  def role?(role)
    return Role.find_by_name(role.to_s.camelize).id == self.role_id
  end
  def self.find_for_database_authentication(conditions={})
    puts conditions[:auth_field]
    self.includes(:card_infos).where(card_infos: {discard: false}).where(card_infos: {card_number: conditions[:auth_field]}).limit(1).first ||
    self.where(email: conditions[:auth_field]).limit(1).first
  end
end
