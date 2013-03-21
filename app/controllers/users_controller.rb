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
    else
      users = users.sort_by_surname('asc')
    end
    @users = users.paginate(per_page: 40, page: params[:page])
    @current_page = params[:page]
  end

  def new
  	@user = User.new(user_detail: UserDetail.new, phones: [Phone.new], contact: Contact.new)
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
    @current_page = params[:current_page]
  	@user = User.find(params[:id])
    # @user.user_detail =   UserDetail.new  if @user.user_detail.nil?
    # @user.phones      <<  Phone.new       if @user.phones.empty?
    # @user.contact     =   Contact.new     if @user.contact.nil?
    # @user.card_infos  <<  CardInfo.new    if @user.card_infos.empty?
  end

  def show
    @user = User.find(params[:id])
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
