# encoding: utf-8
require 'spec_helper'

describe "Towns" do
  include Capybara::DSL
  include Capybara::RSpecMatchers
  
  describe "for SuperAdminUser" do
    it "should allow visit page" do
      login_as_admin
      visit towns_path
      page.should have_content 'Listing towns'
    end
  end

  describe "for RegularUser" do
    it "should not allow to visit page" do
      login_as_regular_user
      visit towns_path
      page.should have_content 'SHOW IT'
    end
  end

  def login_as_admin
    visit '/'
    adm = FactoryGirl.create(:user, role_id: Role.find_by_name('SuperAdminUser').id, password: 'qwertyui')
    fill_in 'Номер карти або e-mail', with: adm.email
    fill_in 'Пароль', with: 'qwertyui'
    click_button 'Вхід'
  end

  def login_as_regular_user
    visit '/'
    adm = FactoryGirl.create(:user, role_id: Role.find_by_name('RegularUser').id, password: 'qwertyui')
    fill_in 'Номер карти або e-mail', with: adm.email
    fill_in 'Пароль', with: 'qwertyui'
    click_button 'Вхід'
  end
end
