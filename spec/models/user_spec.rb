require 'spec_helper'

describe User do
  it "shoud create user"
    count_users = User.all.count
    user = FactoryGirl.create(:user)
    puts user
    User.all.count.should eql(count_users + 1)
end
