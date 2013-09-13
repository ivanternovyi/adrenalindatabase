# encoding: utf-8
class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    if current_user.role? :super_admin_user
      users = User
    elsif current_user.role? :region_admin_user
      users = User.get_by_offices(current_user.towns)
    end
    if params[:sort] == 'surname'
      users = users.sort_by_surname(sort_direction)
    elsif params[:sort] == 'birthday'
      users = users.sort_by_birthday(sort_direction)
    elsif params[:sort] == 'town_office'
      users = users.sort_by_town_office(sort_direction)
    elsif params[:sort] == 'reg_timestamp'
      users = users.sort_by_registration_timestamp(sort_direction)
    else
      users = users.sort_by_registration_timestamp('desc')
    end

    users = users.get_by_card_barcode(params[:s_card_barcode])  if !params[:s_card_barcode].nil? && params[:s_card_barcode] != ''
    users = users.get_by_surname(params[:s_surname])            if !params[:s_surname].nil?
    users = users.get_not_revised                               if !params[:s_not_revised].nil? && params[:s_not_revised] == 'true'
    users = users.get_revised                                   if !params[:s_not_revised].nil? && params[:s_not_revised] == 'false'

    params[:page] = params[:page] == '' ? 1 : params[:page]
    @users = users.paginate(per_page: 40, page: params[:page])
    @current_page = params[:page]
  end

  def new
    @current_page = params[:current_page]
  	@user = User.new(user_detail: UserDetail.new, phones: [Phone.new], contact: Contact.new)
  end

  def create
    @user = User.new(params[:user])
    @user.user_detail.registration_timestamp = DateTime.now
  	if current_user.nil? && @user.save
      usr_det = @user.user_detail
      usr_mail = @user.email
      msg = "#{usr_det.surname} #{usr_det.name} #{usr_det.mid_name}, Ваша заявка успішнго прийнята, авторизація вашого членства у ВГО 'Адреналін', надійде на вказану Вами поштову скриньку #{usr_mail}. Дякуємо за реєстрацію."
      msg = msg << ' Тепер Ви можете подати заявку на тур.' if session[:trip]
      session[:registration_notice] = msg
      redirect_to "/users/sign_in", notice: "Реєстрація успішна."
    elsif !current_user.nil? && @user.save
  		redirect_to root_path
    else
  		render action: 'new'
  	end
  end

  def edit
    @current_page = params[:current_page]
  	@user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @user_trip_dates = @user.user_to_trip_dates
    @trips = Trip.all
  end

  def update
    @current_page = params[:user].delete(:current_page)
  	@user = User.find(params[:id])
  	if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
	    params[:user].delete(:password)
	    params[:user].delete(:password_confirmation)
		end
  	if @user.update_attributes(params[:user])
      if @current_page == ''
        redirect_to( controller: :users, action: :index) 
      else
        redirect_to controller: :users, action: :index, page: @current_page.to_s
      end
  	else
  		render action: 'edit'
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to root_path
  end

  private
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
