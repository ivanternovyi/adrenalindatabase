class FillTowns < ActiveRecord::Migration
  def up
    File.open('db/ukraine_towns.txt').each do |line|
      Town.create(name: line)
    end
  end

  def down
    Towns.destroy_all
  end
end
