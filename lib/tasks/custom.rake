require 'csv'

namespace :adrenalin do
	desc "Show all User details"
	task :greet => :environment do
		User.all.each do |user|
			puts user.user_detail.name if !user.nil? && !user.user_detail.nil?
		end
	end

	desc "Import csv data to database"
	task :import => :environment do
		file = '/Users/admin/Downloads/_data.csv'
		CSV.foreach(file, headers: true) do |row|
			puts row
		end
	end
end