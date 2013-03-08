require 'spec_helper'

describe UserDetail do
  it "should add to database with valid data" do
    count_usr_detail = UserDetail.all.count
    FactoryGirl.create(:user_detail)
    UserDetail.all.count.should be(count_usr_detail + 1)
  end
end
