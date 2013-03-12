require 'spec_helper'

describe Phone do
  it "should be valid data" do
    FactoryGirl.build(:phone).should be_valid
  end

  it "should not empty field phone_number" do
    FactoryGirl.build(:phone, phone_number: nil).should_not be_valid
  end

  it "should be not valid phone_number" do
    FactoryGirl.build(:phone, phone_number: '10').should_not be_valid
    FactoryGirl.build(:phone, phone_number: '2357a83021').should_not be_valid
    FactoryGirl.build(:phone, phone_number: '27492659').should_not be_valid
    FactoryGirl.build(:phone, phone_number: '+383216520432231').should_not be_valid
    FactoryGirl.build(:phone, phone_number: '38321652043231').should_not be_valid
    FactoryGirl.build(:phone, phone_number: '+38321652a322').should_not be_valid
  end
end
