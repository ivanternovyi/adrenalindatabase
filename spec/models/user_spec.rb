require 'spec_helper'

describe User do
  it "should not add user to database if new" do
    usr = FactoryGirl.build(:user)
    usr.id.should be_nil
  end

  it "should have unique email" do
    usr_a = FactoryGirl.create(:user)
    usr_b = FactoryGirl.build(:user, email: usr_a.email)
    usr_b.should_not be_valid
  end

  it "should not be valid without email" do
    FactoryGirl.build(:user, email: '').should_not be_valid
  end

  it "should add user to db with valid data" do
    usr_count = User.all.count
    FactoryGirl.create(:user)
    User.all.count.should be(usr_count + 1)
  end
end
