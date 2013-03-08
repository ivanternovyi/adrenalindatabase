require 'spec_helper'

describe User do
  it "should not add usel to database if new" do
    usr = FactoryGirl.build(:user)
    # usr = User.new(email: "email#{Time.now.to_i}@email.ex", password: '12345678')
    usr.id.should be_nil
  end

  it "should have unique email" do
    usr_a = FactoryGirl.create(:user)
    usr_b = FactoryGirl.build(:user, email: usr_a.email)
    usr_b.should_not be_valid
  end
end
