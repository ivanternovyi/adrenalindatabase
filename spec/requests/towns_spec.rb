# encoding: utf-8
require 'spec_helper'

describe "Towns" do
  include Capybara::DSL
  include Capybara::RSpecMatchers
  
  describe "for SuperAdminUser" do
    before(:each) do
      visit '/'
      @adm = FactoryGirl.create(:user, role_id: Role.find_by_name('SuperAdminUser').id, password: 'qwertyui')
      fill_in 'Номер карти або e-mail', with: @adm.email
      fill_in 'Пароль', with: 'qwertyui'
      click_button 'Вхід'
    end

    it "should allow visit page" do
      visit towns_path
      page.should have_content 'Listing towns'
    end
  end

  describe "for RegularUser" do
    before(:each) do 
      visit '/'
      @usr = FactoryGirl.create(:user, user_detail: FactoryGirl.create(:user_detail), role_id: Role.find_by_name('RegularUser').id, password: 'qwertyui')
      fill_in 'Номер карти або e-mail', with: @usr.email
      fill_in 'Пароль', with: 'qwertyui'
      click_button 'Вхід'
    end
    
    it "should not allow to visit page" do
      visit towns_path
      page.should have_content "Профіль #{@usr.user_detail.surname} #{@usr.user_detail.name} #{@usr.user_detail.mid_name}"
    end
  end
end
