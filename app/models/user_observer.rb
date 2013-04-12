class UserObserver < ActiveRecord::Observer
  def after_create(model)
    if model.new_record?
      if File.exist?("#{Rails.root}/tmp/pids/delayed_job.pid")
        NotifyMailer.delay.notify_register(model)
      else
        NotifyMailer.notify_register(model).deliver
      end
    end
  end
end
