# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :alert => 'Ви не можете бачити цю сторінку. Увійдіть будь-ласка.'
  end

  def after_sign_in_path_for(resource)
    if current_user.role? :regular_user
      if !session[:trip].nil?
        puts "!!!!!!!!!!!!!!!!!! #{session[:trip]}"
        puts "#{trip_path(session[:trip])}"
        return trip_path(session[:trip])
      end

      flash[:alert] = "Ви не можете перейти на цю сторінку."
      current_user
    else
      super
    end
  end
end
