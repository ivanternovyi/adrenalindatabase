# encoding: utf-8
class NotifyMailer < ActionMailer::Base
  default from: "im@adrenalin-ua.com"
  helper :application

  def notify_register(user)
    @user = user
    mail(to: ENV['MAIL'], subject: 'Зареєстровано нового користувача')
  end
end
