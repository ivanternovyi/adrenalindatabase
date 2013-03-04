# encoding: utf-8
class FillTowns < ActiveRecord::Migration
  def up
    File.open('db/ukraine_towns_ua.txt').each do |line|
      Town.create(name: line)
    end
  end

  def down
    Town.destroy_all
  end
end
