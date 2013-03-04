# encoding: utf-8
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

			register_timestamp = 	0,
			username = 						1,
			post_address = 				2,
			birthday = 						3,
			email =								4,
			phone_one =						5,
			phone_two =						6,
			skype = 							7,
			contact_by = 					8,
			user_comment = 			 	9,
			office_town = 				10,

			payment_date_o = 			11,
			payment_method_o = 		12,
			payment_o = 					13,

			card_send_date = 			14,
			date_answer_mail = 		15,
			date_reminder = 			16,
			card_number = 				17,

			payment_date_s = 			18,
			payment_method_s = 		19,
			payment_s = 					20,
			
			payment_reward_s = 		21,
			valid_until_date = 		22

		# headers: true - becouse CSV have first header row
		CSV.foreach(file, headers: true) do |row|
			def chf(val)
				if val == '-' || val == '' || val == '- ' || val == ' -' || val == ' - '
					nil
				else
					val
				end
			end
			
			def parse_name(fullname)
				if chf(fullname).nil?
					name = Array.new
					3.times{ name << nil }
					name
				else 
					fullname.split
				end
			end

			def get_town(name)
				town = Town.where('name LIKE ?', "%#{name}%").first
				if town.nil?
					puts "Warning: Офіс у #{name} - не існує!"
					nil
				else
					town.id
				end
			end

			def set_datetime(var)
				if chf(var).nil?
					nil
				else
					date = var.split(" ")[0]
					date_y, date_m, date_d = date.split(".")[2], date.split(".")[1], date.split(".")[0]
					time = var.split(" ")[1]
					if !time.empty?
						time_h, time_m, time_s = time.split(":")[0], time.split(":")[1], time.split(":")[3]
						Datetime.new(date_y, date_m, date_d, time_h, time_m, time_s)
					else
						Datetime.new(date_y, date_m, date_d, 0, 0, 0)
					end
				end
			end

			passrand = Random.new
			passwd = passrand.rand(10000000..99999999)
			town_office_id = get_town(chf(row[office_town]))

			usr = User.new(
										email: chf(row[email]), 
										password: passwd,
										password_confirmation: passwd, 
										town_office_id: town_office_id
										)
			name_ary = parse_name(row[username])
			user_detail = UserDetail.new(
																	surname: 								name_ary[0], 
																	name: 									name_ary[1], 
																	mid_name: 							name_ary[2],
																	post_address: 					chf(row[post_address]), 
																	birthday: 							chf(row[birthday]),
																	registration_timestamp: set_datetime(row[register_timestamp]),
																	comment: 								chf(row[user_comment])
																	)
			usr.user_detail = user_detail

			card_info = CardInfo.new(
																card_number: 				chf(row[card_number].delete '_'),
																send_date: 					chf(row[card_send_date]),
																reminder_date: 			chf(row[date_reminder]),
																payment_reward: 		chf(row[payment_reward_s]),
																valid_until: 				chf(row[valid_until_date])
																)
			usr.card_infos << card_info
			
			if !chf(row[phone_one]).nil?
				sms = true
				ph_one = Phone.new(
													main: 					sms,
													phone_number: 	row[phone_one]
													)
				usr.phones << ph_one
			end
			
			if !chf(row[phone_two]).nil?
				sms = false
				ph_two = Phone.new(
													main: 					sms,
													phone_number: 	row[phone_two]
													)
				usr.phones << ph_two
			end
			
			contact_on_email = 	row[contact_by].include?('email') ? true : false
			contact_on_skype = 	row[contact_by].include?('skype') || row[contact_by].include?('skype') || !chf(row[skype]).nil? ? true : false
			contact_on_phone =	row[contact_by].include?('SMS') || !ph_one.nil? || !ph_two.nil? ? true : false
			contact = Contact.new(
														by_email: 	contact_on_email,
														by_skype: 	contact_on_skype,
														by_phone: 	contact_on_phone,
														skype_name: chf(row[skype])
														)
			usr.contact = contact

			begin
				usr.save!
				puts "Ok to save user #{row[username]}."
			rescue => error
				puts "Error to save #{row[username]}: #{error.message}"
			end
		end
	end
end