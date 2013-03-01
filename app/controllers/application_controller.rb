class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
  	puts "!!!!!!!!!!!!!!!!!! #{current_user.role? :regular_user}"
  	if current_user.role? :regular_user
  		if current_user.id.blank?
        raise CanCan::AccessDenied.new('Not authorized!')
      else
      	redirect_to user_path(id: current_user.id)
  		end
  	else
  		super
  	end	
  end
end
