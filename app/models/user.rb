class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  after_create :default_role

  devise :database_authenticatable,
          # :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [ :auth_field ]

  attr_accessor :auth_field

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :auth_field, :password, :password_confirmation, 
          :remember_me, :role_id, :town_office_id, :towns, :town_ids, :not_revised,
          :user_detail, :user_detail_attributes, :phones, :phones_attributes, :error_message,
          :contact, :contact_attributes, :card_infos, :card_infos_attributes, :accept_rule

  validates :accept_rule, acceptance: true

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
  accepts_nested_attributes_for :card_infos, allow_destroy: true, reject_if: lambda {|attrs| attrs.all? {|key, value| value.blank?}}

  scope :include_user_detail, joins('left join user_details on users.id = user_details.user_id')
  scope :sort_by_surname, lambda { |opt| include_user_detail.order("user_details.surname #{opt}") }
  scope :sort_by_birthday, lambda { |opt| include_user_detail.order("user_details.birthday #{opt}") }
  scope :sort_by_town_office, lambda { |opt| order("town_office_id #{opt}") }
  scope :get_by_offices, lambda { |town_offises| User.where(town_office_id: town_offises.collect{|admin_towns| admin_towns.id}) }
  scope :get_by_surname, lambda { |opt| include_user_detail.where("lower(user_details.surname) LIKE ?", "%#{opt.mb_chars.downcase.to_s}%") }
  scope :get_revised, where(not_revised: false)
  scope :get_not_revised, where(not_revised: true)

  def role?(role)
    return Role.find_by_name(role.to_s.camelize).id == self.role_id
  end

  def self.find_for_database_authentication(conditions={})
    self.includes(:card_infos).where(card_infos: {discard: false}).where(card_infos: {card_number: conditions[:auth_field]}).limit(1).first ||
    self.where(email: conditions[:auth_field]).limit(1).first
  end

  def email_required?
    false
  end
  
  private
  def default_role
    self.role_id = Role.find_by_name('RegularUser').id
  end
end
