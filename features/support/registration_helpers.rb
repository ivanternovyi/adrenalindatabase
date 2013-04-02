# encoding: utf-8
module RegistrationHelpers
  def select_date(field, val)
    date = val.split(/\//)
    select date[0].to_i, from: 'user_user_detail_attributes_birthday_3i'
    select date[1], from: 'user_user_detail_attributes_birthday_2i'
    select date[2].to_i, from: 'user_user_detail_attributes_birthday_1i'
  end

  def set_checked(field)
    case field
    when /Адреса\sелектронної\sскриньки/
      check 'user_contact_attributes_by_email'
    when /ICQ#/
      check 'user_contact_attributes_by_icq'
    when /Skype/
      check 'user_contact_attributes_by_skype'
    when /Отримувати СМС/
      check 'user_phones_attributes_0_main'
    end
  end
end

World(RegistrationHelpers)