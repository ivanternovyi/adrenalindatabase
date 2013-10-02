# encoding: utf-8
class NotifyMailer < ActionMailer::Base
  default from: "im@adrenalin-ua.com"
  helper :application

  def notify_register(user)
    @user = user
    mailto = ENV['MAIL'].nil? ? 'tst@tst.tst' : ENV['MAIL']
    mail(to: mailto, subject: 'Зареєстровано нового користувача')
  end
end
