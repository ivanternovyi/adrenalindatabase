class UserObserver < ActiveRecord::Observer
  def before_save(model)
    if !model.revised? && model.new_record?
      if Rails.env.production?
        NotifyMailer.delay.notify_register(model)
      else
        NotifyMailer.notify_register(model).deliver
      end
    end
  end
end
