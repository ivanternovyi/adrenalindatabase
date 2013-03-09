require 'spec_helper'

describe UserDetail do
  it "should add to database with valid data" do
    count_usr_detail = UserDetail.all.count
    FactoryGirl.create(:user_detail)
    UserDetail.all.count.should be(count_usr_detail + 1)
  end

  it "should not be valid without name" do
    FactoryGirl.build(:user_detail, name: nil).should_not be_valid
  end

  it "should not be valid without surname" do
    FactoryGirl.build(:user_detail, surname: nil).should_not be_valid
  end

  it "should not be valid without mid_name" do
    FactoryGirl.build(:user_detail, mid_name: nil).should_not be_valid
  end

  it "should not be valid without birthday" do
    FactoryGirl.build(:user_detail, birthday: nil).should_not be_valid
  end

  it "should not be valid without post_address" do
    FactoryGirl.build(:user_detail, post_address: nil).should_not be_valid
  end

  it "shoud not be valid with wrong birthday" do
    FactoryGirl.build(:user_detail, birthday: 'data').should_not be_valid
  end
end
