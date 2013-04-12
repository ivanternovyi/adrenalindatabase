class NotifyMailer < ActionMailer::Base
  default from: "info@adrenalin-ua.com"

  def notify_register(user)
    @user = user
    mail(to: ENV['MAIL'], subject: 'New user registered')
  end
end
