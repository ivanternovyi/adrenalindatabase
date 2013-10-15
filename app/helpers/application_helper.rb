# encoding: utf-8
module ApplicationHelper
	def link_to_add_fields(name, f, association, contrllr = 'users')
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			render("#{contrllr}/fields/" + association.to_s.singularize + "_fields", f: builder)
		end
		link_to(name, '#', class: "add_fields radius small button no-bottom-gap set-top-gap", data: {id: id, fields: fields.gsub("\n", "")})
	end

  def admins_access
    if !current_user.nil? && ((current_user.role? :super_admin_user) || (current_user.role? :region_admin_user))
      yield
    else
      ''
    end
  end

  def sortable(column, title = nil)
    direction = (column == params[:sort] && params[:direction] == 'asc') ? 'desc' : 'asc'
    link_to title, sort: column, direction: direction
  end

  def ua_date_short(date)
    day_str = date.day.to_s.rjust(2, '0')
    mon_str = %w(Січ Лют Бер Квіт Трав Черв Лип Серп Вер Жовт Лист Груд)[date.month - 1]
    year_str = date.year.to_s
    raw "#{day_str}&nbsp;#{mon_str.ljust(4, ' ')}&nbsp;#{year_str}"
  end

  def date_to_text(date)
    if !date.nil?
      date.strftime('%d-%m-%Y')
    else
      ''
    end
  end

  def input_hint_text(txt)
    raw "<div class=\"hint-text\">#{txt}</div>"
  end

  def date_begin_cards
    return Date.today.year - 5
  end

  def date_end_cards
    return Date.today.year + 10
  end
end
