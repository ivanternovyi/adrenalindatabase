require 'spec_helper'

describe AdminUserToTown do
  it "should be add towns to user" do
    user = FactoryGirl.create(:user)
    user.town_ids = [1, 3, 5]
    user.towns.should include(Town.find(1), Town.find(3), Town.find(5))
  end

  it "should be add user to towns" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    user3 = FactoryGirl.create(:user)
    office_users = Town.with_office.first.users
    office_users << user1
    office_users << user2
    office_users << user3
    office_users.should include(user1, user2, user3)
  end
end
