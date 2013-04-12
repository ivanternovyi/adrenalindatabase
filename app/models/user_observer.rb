class UserObserver < ActiveRecord::Observer
  def before_save(model)
        NotifyMailer.delay.notify_register(model)
  end
end
