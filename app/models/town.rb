class Town < ActiveRecord::Base
  after_update :remove_unchecked_offices
  attr_accessible :name, :office, :users

  has_many :admin_user_to_towns, dependent: :destroy
  has_many :users, through: :admin_user_to_towns

  scope :with_office, where(office: true)

  private
  def remove_unchecked_offices
    towns = Town.where(office: false).collect {|t| t.id}
    AdminUserToTown.where(town_id: towns).destroy_all
  end
end
