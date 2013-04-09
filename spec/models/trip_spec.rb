require 'spec_helper'

describe Trip do
  before :each do
    @trip_date = FactoryGirl.create(:trip_date)
    @trip_rule = FactoryGirl.create(:trip_rule)
    @trip = FactoryGirl.create(:trip, trip_rules: [@trip_rule], trip_dates: [@trip_date])
  end

  it "should have at least 1 trip rule" do
    FactoryGirl.build(:trip, trip_rules: [], trip_dates: [@trip_date]).should_not be_valid
  end

  it "should have at least 1 trip date" do
    FactoryGirl.build(:trip, trip_rules: [@trip_rule], trip_dates: []).should_not be_valid
  end

  it "should have many trip rules" do
    2.times{ @trip.trip_rules << FactoryGirl.create(:trip_rule)}
    @trip.trip_rules.size.should eq(3)
  end
  
end