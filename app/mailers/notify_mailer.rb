# encoding: utf-8
class NotifyMailer < ActionMailer::Base
  default from: "im@adrenalin-ua.com"
  helper :application

  def notify_register(user)
    @user = user
    mailto = ENV['MAIL'].nil? ? 'tst@tst.tst' : ENV['MAIL'] unless Rails.env.production?
    mailto = ENV['MAIL'] if Rails.env.production?
    raise("Error: You must to set an administrators email in environment variable ENV['MAIL']!") if mailto.nil?
    mail(to: mailto, subject: 'Зареєстровано нового користувача')
  end
end
