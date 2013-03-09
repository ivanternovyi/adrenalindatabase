require 'spec_helper'

describe Role do
  it "should not be valid without name" do
    FactoryGirl.build(:role, name: '').should_not be_valid
  end

  it "should add valid record to database" do
    count_records = Role.all.count
    FactoryGirl.create(:role, name: '')
    Role.all.count.should be(count_records + 1)
  end
end
