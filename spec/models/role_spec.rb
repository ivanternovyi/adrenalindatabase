require 'spec_helper'

describe Role do
  it "should not be valid without name" do
    FactoryGirl.build(:role, name: '').should_not be_valid
  end

  it "should add valid record to database" do
    count_records = Role.all.count
    FactoryGirl.create(:role)
    Role.all.count.should be(count_records + 1)
  end

  it "should be uniquenes name" do
    role = FactoryGirl.create(:role)
    FactoryGirl.build(:role, name: role.name).should_not be_valid
  end

  it "should exist SuperAdminUser" do
    Role.find_by_name('SuperAdminUser').should_not be_nil
  end

  it "should exist RegionAdminUser" do
    Role.find_by_name('RegionAdminUser').should_not be_nil
  end

  it "should exist OperatorUser" do
    Role.find_by_name('OperatorUser').should_not be_nil
  end
  
  it "should exist RegularUser" do
    Role.find_by_name('RegularUser').should_not be_nil
  end

end
