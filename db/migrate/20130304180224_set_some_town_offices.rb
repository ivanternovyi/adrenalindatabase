# encoding: utf-8
class SetSomeTownOffices < ActiveRecord::Migration
  def up
  	towns = ['Київ', 'Одеса', 'Симферополь']
    towns.each{ |town| t = Town.where('name LIKE ?', "%#{town}%").first
    	t.office = true if !t.nil?
    	t.save }
  end

  def down
  end
end
