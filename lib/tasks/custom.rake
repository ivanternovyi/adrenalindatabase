# encoding: utf-8
require 'csv'

namespace :adrenalin do
	desc "Show all User details"
	task :greet => :environment do
		User.all.each do |user|
			puts user.user_detail.name if !user.nil? && !user.user_detail.nil?
		end
	end

	desc "Parse data"
	task :reg_dat, :dtime do |t, arg|
		def chf(val)
			val.gsub! "\r", "" if !val.nil?
			if val == '-' || val == '' || val == '- ' || val == ' -' || val == ' - '
				nil
			else
				val
			end
		end

		def set_datetime(var)
			if !var.nil?
				date = var.split(" ")[0]
				date_y, date_m, date_d = date.split(".")[2], date.split(".")[1], date.split(".")[0]
				time = var.split(" ")[1]
				if !time.empty?
					time_h, time_m, time_s = time.split(":")[0], time.split(":")[1], time.split(":")[3]
					DateTime.new(date_y.to_i, date_m.to_i, date_d.to_i, time_h.to_i, time_m.to_i, time_s.to_i)
				else
					DateTime.new(date_y.to_i, date_m.to_i, date_d.to_i, 0, 0, 0)
				end
			else
				p 'value is NIL!'
				nil
			end
		end
		p set_datetime arg[:dtime]
	end

	desc "Barcode generator based on card code XXXX (X - is digit)"
	task :barcode, :code do |t, args|
		def is_digit(var)
			if (var =~ /^[0-9]+$/).nil?
				false
			elsif (var =~ /^[0-9]+$/) == 0
				true
			end
		end
		def code_to_barcode(code)
			if is_digit(code) && (code.length == 4)
				const_prefix = '000'
				full_dig_array = (const_prefix + code).scan(/./)

				odd_num_dig_sum = 0
				full_dig_array.each_with_index{ |val, index| odd_num_dig_sum += val.to_i if (index + 1).odd? }

				even_num_dig_sum = 0
				full_dig_array.each_with_index{ |val, index| even_num_dig_sum += val.to_i if (index + 1).even? }

				odd_num_dig_sum *= 3
				substruction = ((even_num_dig_sum + odd_num_dig_sum) % 10)
	      if substruction == 0
	        substruction = 10
	      end
	      check_digit = 10 - substruction
				const_prefix + code + check_digit.to_s
			else
				puts "Помилковий код карти #{code} !"
				'00000000'
			end
		end
		puts code_to_barcode args[:code]
	end

	desc "Import csv data to database set path to file: rake adrenalin:import FILEPATH=path_to_file"
	task :import => :environment do

		reg_timest = 					0
		username = 						1
		post_address = 				2
		birthday = 						3
		email =								4
		phone_one =						5
		phone_two =						6
		skype = 							7
		contact_by = 					8
		user_comment = 			 	9
		office_town = 				10

		payment_date_o = 			11
		payment_method_o = 		12
		payment_o = 					13

		card_send_date = 			14
		date_answer_mail = 		15
		date_reminder = 			16
		card_number = 				17

		payment_date_s = 			18
		payment_method_s = 		19
		payment_s = 					20

		payment_reward_s = 		21
		valid_until_date = 		22

		def chf(val)
			val.gsub! "\r", "" if !val.nil?
			if val == '-' || val == '' || val == '- ' || val == ' -' || val == ' - '
				nil
			else
				val
			end
		end

		def show_err(user, show_txt, fill_txt, usr)
			puts show_txt
			usr.not_revised = true
			if usr.error_message.nil?
				usr.error_message = show_txt
			else
				usr.error_message += "; #{show_txt} "
			end
			return fill_txt
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
				if !time.nil? && !time.empty?
					time_h, time_m, time_s = time.split(":")[0], time.split(":")[1], time.split(":")[3]
					DateTime.new(date_y.to_i, date_m.to_i, date_d.to_i, time_h.to_i, time_m.to_i, time_s.to_i)
				else
					DateTime.new(date_y.to_i, date_m.to_i, date_d.to_i, 0, 0, 0)
				end
			end
		end

		def days_in_month(year, month)
		  (Date.new(year, 12, 31) << (12-month)).day
		end

		def set_date(var)
			if chf(var).nil?
				nil
			else
				date_ary = var.split('.')
				date_y, date_m, date_d = date_ary[2], date_ary[1], date_ary[0]
				return nil if date_y.nil? || date_m.nil? || date_d.nil?
				return nil if date_m.to_i > 12 || date_m.to_i < 1
				return nil if 1 > date_d.to_i || date_d.to_i > days_in_month(date_y.to_i, date_m.to_i)
				Date.new(date_y.to_i, date_m.to_i, date_d.to_i)
			end
		end

		def is_digit(var)
			if (var =~ /^[0-9]+$/).nil?
				false
			elsif (var =~ /^[0-9]+$/) == 0
				true
			end
		end

		def code_to_barcode(code)
			if is_digit(code) && (code.length == 4)
				const_prefix = '000'
				full_dig_array = (const_prefix + code).scan(/./)

				odd_num_dig_sum = 0
				full_dig_array.each_with_index{ |val, index| odd_num_dig_sum += val.to_i if (index + 1).odd? }

				even_num_dig_sum = 0
				full_dig_array.each_with_index{ |val, index| even_num_dig_sum += val.to_i if (index + 1).even? }

				odd_num_dig_sum *= 3
				check_digit = 10 - ((even_num_dig_sum + odd_num_dig_sum) % 10)
				const_prefix + code + check_digit.to_s
			else
				puts "Помилковий код карти #{code} !" if !code.empty?
				puts "Нема картки!" if code.empty?
				'00000000'
			end
		end
		# headers: true - becouse CSV have first header row
			iterator = 0
		CSV.foreach(ENV['FILEPATH']) do |row|
			iterator += 1
			passrand = Random.new
			passwd = passrand.rand(10000000..99999999)
			usr = User.new(
										email: chf(row[email]), 
										password: passwd,
										password_confirmation: passwd, 
										not_revised: false
										)
			usr.town_office_id = get_town(chf(row[office_town])) || show_err(row[username], "Помилкове або відсутнє місто з офісом!", 1, usr)
			if !usr.valid?
				usr.email = show_err(row[username], "Помилковий або відсутній email!", "nil#{iterator}@nil.nil", usr)
			end
			name_ary = parse_name(row[username])
			user_detail = UserDetail.new(
																	surname: 								name_ary[0] || show_err(row[username], "Відсутнє прізвище!", "nil#{iterator}", usr), 
																	name: 									name_ary[1] || show_err(row[username], "Відсутнє ім'я!", "nil#{iterator}", usr), 
																	mid_name: 							name_ary[2] || show_err(row[username], "Відсутнє по-Батькові!", "nil#{iterator}", usr),
																	post_address: 					chf(row[post_address]) || show_err(row[username], "Відсутня поштова адреса!", "nil#{iterator}", usr), 
																	birthday: 							set_date(row[birthday]) || show_err(row[username], "Відсутня дата народження", 70.years.ago, usr),
																	registration_timestamp: set_datetime(row[reg_timest]),
																	comment: 								chf(row[user_comment])
																	)
			usr.user_detail = user_detail

			if !chf(row[phone_one]).nil?
				sms = true
				ph_one = Phone.new(
													main: 					sms,
													phone_number: 	row[phone_one].gsub(/\D|\s|\W/, '')
													)
				if !ph_one.valid?
					ph_one.phone_number = show_err(row[username], "Помилковий номер телефону!", ('+' + iterator.to_s.ljust(12, '0')), usr)
				end
				usr.phones << ph_one
			end
			
			if !chf(row[phone_two]).nil?
				sms = false
				ph_two = Phone.new(
													main: 					sms,
													phone_number: 	row[phone_two].gsub(/\D|\s|\W/, '')
													)
				if !ph_two.valid?
					ph_two.phone_number = show_err(row[username], "Помилковий номер телефону!", ('+' + iterator.to_s.ljust(12, '0')), usr)
				end
				usr.phones << ph_two
			end
			
			if chf(row[contact_by]).nil?
				contact_on_email, contact_on_skype, contact_on_phone = false, false, false
			else
				contact_on_email = 	row[contact_by].include?('email') ? true : false
				contact_on_skype = 	row[contact_by].include?('skype') || row[contact_by].include?('Skype') || !chf(row[skype]).nil? ? true : false
				contact_on_phone =	row[contact_by].include?('SMS') || !ph_one.nil? || !ph_two.nil? ? true : false
			end
			contact = Contact.new(
														by_email: 	contact_on_email,
														by_skype: 	contact_on_skype,
														by_phone: 	contact_on_phone,
														skype_name: chf(row[skype])
														)
			usr.contact = contact


			card_num = chf(row[card_number]).nil? ? nil : chf(row[card_number]).delete('_')
			unlimit = !chf(row[valid_until_date]).nil? && !(row[valid_until_date].index 'unlim').nil? ? true : false
			val_until = !unlimit && !chf(row[valid_until_date]).nil? ? set_date(row[valid_until_date]) : nil
			if !card_num.nil? 
				card_info = CardInfo.new(
																	card_number: 				card_num,
																	barcode: 						code_to_barcode(card_num),
																	send_date: 					set_date(row[card_send_date]),
																	reminder_date: 			set_date(row[date_reminder]),
																	payment_reward: 		chf(row[payment_reward_s]),
																	valid_unlimit: 			unlimit,
																	valid_until: 				val_until
																	)
				if !card_info.valid?
					card_info.card_number = show_err(row[username], "Помилковий номер карти!", iterator.to_s.ljust(4, '9'), usr)
				elsif CardInfo.where(card_number: card_num).nil?
					card_info.card_number = show_err(row[username], "Дублюється номер карти!", iterator.to_s.ljust(4, '9'), usr)
				end
					
				usr.card_infos << card_info
			
				if !chf(row[payment_o]).nil? && !chf(row[payment_date_o]).nil?
					card_info.payment_infos << PaymentInfo.new(
																											payment: chf(row[payment_o]),
																											payment_date: set_date(row[payment_date_o]),
																											paying_method: chf(row[payment_method_o])
																										)
				end
				if !chf(row[payment_s]).nil? && !chf(row[payment_date_s]).nil?
					card_info.payment_infos << PaymentInfo.new(
																											payment: chf(row[payment_s]),
																											payment_date: set_date(row[payment_date_s]),
																											paying_method: chf(row[payment_method_s])
																										)
				end
			end


			begin
				usr.save!
			rescue => error
				puts "Error, can`t save #{row[username]}: #{error.message}"
				puts '------------------------------------------------------'
			end
		end
	end

end