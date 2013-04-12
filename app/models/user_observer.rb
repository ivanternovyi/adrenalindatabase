class UserObserver < ActiveRecord::Observer
  def after_commit(model)
    NotifyMailer.notify_register(model).deliver
  end
end
