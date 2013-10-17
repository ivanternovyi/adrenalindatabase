module UsersHelper
	def card_number_text(user)
		if !user.card_infos.active_card.nil?
			user.card_infos.active_card.card_number
		else
			nil
		end
	end

  def show_ordered_trips(user_trip_order)
    trip_title = user_trip_order.trip.title
    trip_price = "#{user_trip_order.price}&nbsp;#{t :valute}"
    trip_dates = user_trip_order.trip_date.nil? ? t(:deleted_trip_date, scope: :trip_date) : 
                                                  "#{l user_trip_order.trip_date.date_f} ... #{l user_trip_order.trip_date.date_t}"
    content_tag :div, class: "row" do
      content_tag :div, class: "large-12 small-12 columns set-bottom-gap" do
        cod = content_tag(:strong, "#{trip_title}: ")
        cod << content_tag(:span, "#{trip_dates} ", class: 'small-text')
        cod << content_tag(:span, raw("- #{trip_price}"))
      end
    end
  end

  def card_valid_to(card)
    # <%= l card.valid_until, format: :long %> 
  end
end
