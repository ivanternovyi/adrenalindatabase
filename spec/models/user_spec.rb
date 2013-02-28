require 'spec_helper'

describe User do
  let(:user) {User.new}

  it "should require email" do
  	user.email = nil
  	user.should_not be_valid
  	user.errors.on(:email).should_not be_valid
  end
end
