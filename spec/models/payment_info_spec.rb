require 'spec_helper'

describe PaymentInfo do
  it "should be not empty payment" do
    FactoryGirl.build(:payment_info, payment: nil).should_not be_valid
  end

  it "should be not empty payment_date" do
    FactoryGirl.build(:payment_info, payment_date: nil).should_not be_valid
  end

  it "should be valid with right data" do
    FactoryGirl.build(:payment_info).should be_valid
  end
end
