require 'spec_helper'

describe Town do
  it "should not be valid without name" do
    town = FactoryGirl.build(:town, name: nil)
    town.should_not be_valid
  end

  it "should be saved with valid data" do
    count_towns = Town.all.count
    town = FactoryGirl.create(:town)
    Town.all.count.should be(count_towns + 1)
  end

  it "should be without office by default" do
    town = Town.create(name: "town#{Time.now.to_i}")
    town.office.should eq(false)
  end
end
