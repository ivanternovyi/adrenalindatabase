require 'spec_helper'

describe Contact do
  it "should be valid" do
    FactoryGirl.build(:contact).should be_valid
  end

  it "should be invalid" do
    FactoryGirl.build(:contact, icq_number: 'sdssd').should_not be_valid
  end
end
