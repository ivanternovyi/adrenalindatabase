# encoding: UTF-8
class FillRoles < ActiveRecord::Migration
  def up
    Role.create(name: 'SuperAdminUser', description: 'Имеется доступ ко всем ресурсам.')
    Role.create(name: 'RegionAdminUser', description: 'Имеется доступ к инофрмации по пользователям только выбранных регионов.')
    Role.create(name: 'OperatorUser', description: 'Доступ к информации по картам пользователей.')
    Role.create(name: 'RegularUser', description: 'Только доступ к чтению своего личного профиля.')
  end

  def down
    Role.destroy_all
  end
end
