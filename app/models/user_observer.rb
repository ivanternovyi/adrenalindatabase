class UserObserver < ActiveRecord::Observer
  def after_commit(model)
    if Rails.env.production?
      NotifyMailer.delay.notify_register(model)
    else
      NotifyMailer.notify_register(model).deliver
    end
  end
end
