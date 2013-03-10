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

  describe "associated models" do
    it "should have one user detail" do
      usr_det = FactoryGirl.create(:user_detail)
      usr = FactoryGirl.create(:user, user_detail: usr_det)
      usr.user_detail.should eql(usr_det)
    end

    it "should have many card_infos" do
      usr = FactoryGirl.create(:user)
      3.times{ usr.card_infos << FactoryGirl.create(:card_info) }
      usr.card_infos.count.should be(3)
    end
  end
end
