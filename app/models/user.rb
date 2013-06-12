class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  after_create :default_role

  devise :database_authenticatable,
          # :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [ :auth_field ]

  attr_accessor :auth_field, :skip_mail_on_create

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :auth_field, :password, :password_confirmation, 
          :remember_me, :role_id, :town_office_id, :towns, :town_ids, :not_revised,
          :user_detail, :user_detail_attributes, :phones, :phones_attributes, :error_message,
          :contact, :contact_attributes, :card_infos, :card_infos_attributes, :accept_rule,
          :skip_mail_on_create, :user_to_trip_dates

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

  has_many :user_to_trip_dates, dependent: :destroy

  scope :include_user_detail, joins('left join user_details on users.id = user_details.user_id')
  scope :include_card_info, joins('left join card_infos on users.id = card_infos.user_id')
  scope :sort_by_surname, lambda { |opt| include_user_detail.order("user_details.surname #{opt}") }
  scope :sort_by_birthday, lambda { |opt| include_user_detail.order("user_details.birthday #{opt}") }
  scope :sort_by_registration_timestamp, lambda { |opt| include_user_detail.order("user_details.registration_timestamp #{opt}") }
  scope :sort_by_town_office, lambda { |opt| order("town_office_id #{opt}") }
  scope :get_by_offices, lambda { |town_offises| User.where(town_office_id: town_offises.collect{|admin_towns| admin_towns.id}) }
  scope :get_by_card_number, lambda { |card_number| 
    clear_number = card_number.scan(/\d/).join.to_s
    clear_number = "%#{clear_number}%" if !(clear_number == '') 
    User.include_card_info.where("card_number LIKE ?", clear_number) }
  scope :get_by_surname, lambda { |opt| include_user_detail.where("lower(user_details.surname) LIKE ?", "%#{opt.mb_chars.downcase.to_s}%") }
  scope :get_revised, where(not_revised: false)
  scope :get_not_revised, where(not_revised: true)

  def role?(role)
    return Role.find_by_name(role.to_s.camelize).id == self.role_id
  end

  def revised?
    return !self.not_revised
  end

  def self.user_on_card_number(code)
    User.CardInfo.where(card_number: code)
  end

  def self.find_for_database_authentication(conditions={})
    self.includes(:card_infos).where(card_infos: {discard: false}).where(card_infos: {card_number: conditions[:auth_field]}).limit(1).first ||
    self.where(email: conditions[:auth_field]).limit(1).first
  end
  
  private
  def default_role
    self.role_id = Role.find_by_name('RegularUser').id
  end
end
