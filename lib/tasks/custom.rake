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

		d = {
									register_timestamp: 	0,
									username: 						1,
									post_address: 				2,
									birthday: 						3,
									email: 								4,
									phone_one: 						5,
									phone_two: 						6,
									skype: 								7,
									contact_by: 					8,
									user_comment: 			 	9,
									office_town: 					10,

									payment_date_o: 			11,
									payment_method_o: 		12,
									payment_o: 						13,

									card_send_date: 			14,
									date_answer_mail: 		15,
									date_reminder: 				16,
									card_number: 					17,

									payment_date_s: 			18,
									payment_method_s: 		19,
									payment_s: 						20,
									payment_reward_s: 		21,
									valid_until_date: 		22

		}

		# headers: true - becouse CSV have first header row
		CSV.foreach(file, headers: true) do |row|
			puts row[d[:username]]
			
		end

	end
end