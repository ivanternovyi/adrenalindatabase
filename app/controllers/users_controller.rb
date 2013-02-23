class UsersController < ApplicationController
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def new
  	@user = User.new
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
