# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130409132130) do

  create_table "admin_user_to_towns", :force => true do |t|
    t.integer  "user_id"
    t.integer  "town_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "admin_user_to_towns", ["town_id"], :name => "index_admin_user_to_towns_on_town_id"
  add_index "admin_user_to_towns", ["user_id"], :name => "index_admin_user_to_towns_on_user_id"

  create_table "card_infos", :force => true do |t|
    t.integer  "user_id"
    t.string   "barcode"
    t.date     "send_date"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.text     "comment"
    t.date     "valid_until"
    t.boolean  "valid_unlimit",  :default => false
    t.boolean  "discard",        :default => false
    t.string   "card_number"
    t.date     "reminder_date"
    t.integer  "payment_reward"
  end

  add_index "card_infos", ["barcode"], :name => "index_card_infos_on_barcode"
  add_index "card_infos", ["card_number"], :name => "index_card_infos_on_card_number", :unique => true
  add_index "card_infos", ["user_id"], :name => "index_card_infos_on_user_id"

  create_table "contacts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "icq_number"
    t.string   "skype_name"
    t.boolean  "by_icq"
    t.boolean  "by_skype"
    t.boolean  "by_email"
    t.boolean  "by_phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "contacts", ["icq_number"], :name => "index_contacts_on_icq_number"
  add_index "contacts", ["skype_name"], :name => "index_contacts_on_skype_name"
  add_index "contacts", ["user_id"], :name => "index_contacts_on_user_id"

  create_table "payment_infos", :force => true do |t|
    t.integer  "card_info_id"
    t.date     "payment_date"
    t.integer  "payment"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "paying_method"
  end

  add_index "payment_infos", ["card_info_id"], :name => "index_payment_infos_on_card_info_id"

  create_table "phones", :force => true do |t|
    t.integer  "user_id"
    t.string   "phone_number"
    t.boolean  "main",         :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "phones", ["main"], :name => "index_phones_on_main"
  add_index "phones", ["phone_number"], :name => "index_phones_on_phone_number"
  add_index "phones", ["user_id"], :name => "index_phones_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "roles", ["name"], :name => "index_roles_on_name", :unique => true

  create_table "towns", :force => true do |t|
    t.string   "name"
    t.boolean  "office",     :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "towns", ["name"], :name => "index_towns_on_name"

  create_table "trip_dates", :force => true do |t|
    t.date     "date_from"
    t.date     "date_to"
    t.integer  "trip_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "trip_dates", ["date_from"], :name => "index_trip_dates_on_date_from"
  add_index "trip_dates", ["date_to"], :name => "index_trip_dates_on_date_to"
  add_index "trip_dates", ["trip_id"], :name => "index_trip_dates_on_trip_id"

  create_table "trip_rules", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trip_to_trip_rules", :force => true do |t|
    t.integer  "trip_id"
    t.integer  "trip_rule_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "trip_to_trip_rules", ["trip_id"], :name => "index_trip_to_trip_rules_on_trip_id"
  add_index "trip_to_trip_rules", ["trip_rule_id"], :name => "index_trip_to_trip_rules_on_trip_rule_id"

  create_table "trips", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_details", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "surname"
    t.string   "mid_name"
    t.string   "post_address"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.date     "birthday"
    t.datetime "registration_timestamp"
    t.text     "comment"
  end

  add_index "user_details", ["birthday"], :name => "index_user_details_on_birthday"
  add_index "user_details", ["mid_name"], :name => "index_user_details_on_mid_name"
  add_index "user_details", ["name"], :name => "index_user_details_on_name"
  add_index "user_details", ["surname"], :name => "index_user_details_on_surname"
  add_index "user_details", ["user_id"], :name => "index_user_details_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",   :null => false
    t.string   "encrypted_password",     :default => "",   :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "town_office_id"
    t.integer  "role_id",                :default => 4
    t.boolean  "not_revised",            :default => true
    t.text     "error_message"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["not_revised"], :name => "index_users_on_not_revised"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role_id"], :name => "index_users_on_role_id"
  add_index "users", ["town_office_id"], :name => "index_users_on_town_office_id"

end
