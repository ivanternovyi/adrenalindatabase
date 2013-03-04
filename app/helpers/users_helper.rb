module UsersHelper
	def card_number_text(user)
		if !user.card_infos.active_card.nil?
			user.card_infos.active_card.card_number
		else
			nil
		end
	end
end
