require 'spec_helper'

describe User do
  before :each do
    # revove default admin user
    User.find(1).delete
  end

  it "should not add user to database if new" do
    usr = FactoryGirl.build(:user)
    usr.id.should be_nil
  end

  it "should have unique email" do
    usr_a = FactoryGirl.create(:user)
    usr_b = FactoryGirl.build(:user, email: usr_a.email)
    usr_b.should_not be_valid
  end

  it "should be valid without email" do
    FactoryGirl.build(:user, email: '').should be_valid
  end

  it "should add user to db with valid data" do
    usr_count = User.all.count
    FactoryGirl.create(:user)
    User.all.count.should be(usr_count + 1)
  end

  it "should be sorted by surname asc" do
    usr_a = FactoryGirl.create(:user, user_detail: FactoryGirl.create(:user_detail, surname: 'Albar'))
    usr_b = FactoryGirl.create(:user, user_detail: FactoryGirl.create(:user_detail, surname: 'Almar'))
    usr_c = FactoryGirl.create(:user, user_detail: FactoryGirl.create(:user_detail, surname: 'Aamar'))
    User.sort_by_surname(:asc).should eq([usr_c, usr_a, usr_b])
  end

  it "should be sorted by birthdate asc" do
    usr_a = FactoryGirl.create(:user, user_detail: FactoryGirl.create(:user_detail, birthday: 30.years.ago))
    usr_b = FactoryGirl.create(:user, user_detail: FactoryGirl.create(:user_detail, birthday: 25.years.ago))
    usr_c = FactoryGirl.create(:user, user_detail: FactoryGirl.create(:user_detail, birthday: 42.years.ago))
    User.sort_by_birthday(:asc).should eq([usr_c, usr_a, usr_b])

  end

  it "should be sorted by town office asc" do
    usr_a = FactoryGirl.create(:user, town_office_id: 6)
    usr_b = FactoryGirl.create(:user, town_office_id: 8)
    usr_c = FactoryGirl.create(:user, town_office_id: 3)
    User.sort_by_town_office(:asc).should eq([usr_c, usr_a, usr_b])
  end

  describe "get and search users" do
    it "should return users that have defined letters" do
      10.times{ FactoryGirl.create(:user, user_detail: FactoryGirl.create(:user_detail)) }
      user1 = FactoryGirl.create(:user, user_detail: FactoryGirl.create(:user_detail, surname: "Defesd"))
      user2 = FactoryGirl.create(:user, user_detail: FactoryGirl.create(:user_detail, surname: "Dofesd"))
      user3 = FactoryGirl.create(:user, user_detail: FactoryGirl.create(:user_detail, surname: "Deferd"))
      User.get_by_surname('Fe').should include(user1, user2, user3)
    end

    describe "revised users" do
      before(:each) do
        @user1 = FactoryGirl.create(:user)
        @user2 = FactoryGirl.create(:user, not_revised: false)
        @user3 = FactoryGirl.create(:user)
        @user4 = FactoryGirl.create(:user, not_revised: false)
      end

      it "should return revised users" do
        User.get_revised.should include(@user2, @user4)
      end

      it "should return not revised users" do
        User.get_not_revised.should include(@user1, @user3)
      end
    end
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

    describe "contact" do
      it "should has one valid record" do
        usr_cont = FactoryGirl.create(:contact)
        usr = FactoryGirl.create(:user, contact: usr_cont)
        usr.contact.should eql(usr_cont)
      end

      it "should destroy belonging record" do
        usr_cont = FactoryGirl.create(:contact)
        usr_cont_id = usr_cont.id
        usr = FactoryGirl.create(:user, contact: usr_cont)
        usr.destroy
        Contact.find_by_id(usr_cont_id).should be_nil
      end
    end
  end
end
