# encoding: utf-8
require 'spec_helper'

describe "Users" do 
  include Capybara::DSL
  include Capybara::RSpecMatchers
  
  it "should cause log in user" do
    visit '/'
    page.should have_content "You are not authorized to access this page."    
  end

  it "should create new user" do
    visit '/users/new'
    page.should have_content "Новый учасник"
  end

  it "should redirect to user profile if regular user exist and login" do
    user = FactoryGirl.create(:user, role_id: Role.find_by_name('RegularUser').id)
    visit '/'
    fill_in "Номер карти або e-mail", with: user.email
    fill_in "Пароль", with: user.password
    click_button 'Вхід'
    page.should have_content "SHOW IT"
  end
end