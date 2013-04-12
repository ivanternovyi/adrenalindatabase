class UserObserver < ActiveRecord::Observer
  def before_save(model)
    @was_a_new_record = model.new_record?
    return true
  end

  def after_save(model)
    if @was_a_new_record
      if File.exist?("#{Rails.root}/tmp/pids/delayed_job.pid")
        NotifyMailer.delay.notify_register(model)
      else
        NotifyMailer.notify_register(model).deliver
      end
    end
  end
end
