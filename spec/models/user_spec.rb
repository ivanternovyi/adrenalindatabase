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
    describe "user_detail" do
      it "should have one record" do
        usr_det = FactoryGirl.create(:user_detail)
        usr = FactoryGirl.create(:user, user_detail: usr_det)
        usr.user_detail.should eql(usr_det)
      end

      it "shoud destroy belonging user_detail" do
        usr_det = FactoryGirl.create(:user_detail)
        usr_det_id = usr_det.id
        usr = FactoryGirl.create(:user, user_detail: usr_det)
        usr.destroy
        UserDetail.find_by_id(usr_det_id).should be_nil
      end
    end

    describe "card_infos" do
      it "should have many records" do
        usr = FactoryGirl.create(:user)
        3.times{ usr.card_infos << FactoryGirl.create(:card_info) }
        usr.card_infos.count.should be(3)
      end

      it "should destroy when user destroy" do
        usr = FactoryGirl.create(:user)
        3.times{ usr.card_infos << FactoryGirl.create(:card_info) }
        card_ids = usr.card_infos.collect { |ph_id| ph_id.id }
        usr.destroy
        card_ids.each { |id| CardInfo.find_by_id(id).should be_nil }
      end
    end

    describe "phones" do
      it "should have many records" do
        usr = FactoryGirl.create(:user)
        3.times{ usr.phones << FactoryGirl.create(:phone) }
        usr.phones.count.should be(3)
      end    

      it "should destroy when user destroy" do
        usr = FactoryGirl.create(:user)
        3.times{ usr.phones << FactoryGirl.create(:phone) }
        ph_ids = usr.phones.collect { |ph_id| ph_id.id }
        usr.destroy
        ph_ids.each { |id| Phone.find_by_id(id).should be_nil }
      end
    end
  end
end
