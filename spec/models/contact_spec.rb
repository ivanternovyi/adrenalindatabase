require 'spec_helper'

describe Contact do
  it "should be valid" do
    FactoryGirl.build(:contact).should be_valid
  end
end
