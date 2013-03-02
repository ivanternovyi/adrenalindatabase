class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    if current_user.role? :super_admin_user
      @users = User.all
    elsif current_user.role? :region_admin_user
      @users = User.where(town_office_id: current_user.towns.collect{|admin_towns| admin_towns.id})
    end
  end

  def new
  	@user = User.new(user_detail: UserDetail.new, phones: [Phone.new], contact: Contact.new, card_info: [CardInfo.new])
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		redirect_to root_path
  	else
  		render action: 'new'
  	end
  end

  def edit
  	@user = User.find(params[:id])
    @user.user_detail =   UserDetail.new  if @user.user_detail.nil?
    @user.phones      <<  Phone.new       if @user.phones.empty?
    @user.contact     =   Contact.new     if @user.contact.nil?
    @user.card_infos  <<  CardInfo.new    if @user.card_infos.empty?
  end

  def update
  	@user = User.find(params[:id])
  	if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
	    params[:user].delete(:password)
	    params[:user].delete(:password_confirmation)
		end
  	if @user.update_attributes(params[:user])
  		redirect_to root_path
  	else
  		render action: 'edit'
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to root_path
  end
end
