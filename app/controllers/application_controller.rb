class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
  	if current_user.role? :regular_user
  		current_user
  	else
  		super
  	end	
  end

  def down_case(txt)
    txt.mb_chars.downcase.to_s
  end
end
