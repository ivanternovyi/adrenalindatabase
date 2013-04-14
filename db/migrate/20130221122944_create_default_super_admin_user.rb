class CreateDefaultSuperAdminUser < ActiveRecord::Migration
  def up
    User.create(skip_mail_on_create: true, email: 'adm@adm.adm', password: 'administrator', password_confirmation: 'administrator', role_id: Role.find_by_name('SuperAdminUser').id)
  end

  def down
  end
end
