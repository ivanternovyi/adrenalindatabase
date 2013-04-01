# encoding: utf-8
require 'spec_helper'

describe "Users" do 
  include Capybara::DSL
  include Capybara::RSpecMatchers
  
  describe "Unlogged" do
    it "should cause log in user" do
      visit '/'
      page.should have_content "Ви не можете бачити цю сторінку. Увійдіть будь-ласка. Вхід Номер карти або e-mail Пароль Запам'ятати мене Нагадати пароль?"    
    end

    describe "Registration" do
      it "should create new user" do
        visit '/users/new'
        page.should have_content "Заявка на членство в ВГО «Адреналін»"
      end

      it "should not see topmenu" do
        visit '/users/new'
        page.should_not have_css "div.main_nav"
      end

      it "should not see Back link" do
        visit "/users/new"
        page.should_not have_content "Назад"
      end

      it "should not see info about profile errors" do
        visit "/users/new"
        page.should_not have_content "Помилки у профілі користувача:"
      end

      it "should not see info about date registration" do
        visit "/users/new"
        page.should_not have_content "Користувача зареєстровано"
      end

      it "should not see add card" do
        visit "/users/new"
        page.should_not have_content "Додати карту"
      end
    end
  end

  describe "Regular" do
    before(:each) do
      @user_reg = FactoryGirl.create(:user, user_detail: FactoryGirl.create(:user_detail), role_id: Role.find_by_name('RegularUser').id)
    end

    it "should redirect to user profile if regular user exist and login" do
      visit '/'
      fill_in "Номер карти або e-mail", with: @user_reg.email
      fill_in "Пароль", with: @user_reg.password
      click_button 'Вхід'
      page.should have_content "Профіль #{@user_reg.user_detail.surname} #{@user_reg.user_detail.name} #{@user_reg.user_detail.mid_name}"
    end
  end
end