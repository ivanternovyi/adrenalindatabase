namespace :adrenalin do
	desc "Show all User details"
	task :greet => :environment do
		User.all.each do |user|
			puts user.user_detail
		end
	end
end