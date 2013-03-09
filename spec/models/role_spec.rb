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
end
