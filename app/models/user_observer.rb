class UserObserver < ActiveRecord::Observer
  def after_commit(model)
    NotifyMailer.delay.notify_register(model)
  end
end
