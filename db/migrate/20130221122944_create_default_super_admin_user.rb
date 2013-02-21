class CreateDefaultSuperAdminUser < ActiveRecord::Migration
  def up
    User.create(email: 'adm@adm.adm', password: 'administrator', password_confirmation: 'administrator', role_id: Role.find_by_name('SuperAdminUser').id)
  end

  def down
  end
end
