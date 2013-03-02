module UsersHelper
	def card_number_text(user)
		user.card_infos.active_card.card_number
	end
end
