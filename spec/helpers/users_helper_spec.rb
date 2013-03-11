require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe UsersHelper do
  describe "check card_number_text" do
    it "should return nil if no cards" do
      card_number_text(FactoryGirl.create(:user)).should be_nil
    end

    it "should return nil if no active card" do
      card_number_text(FactoryGirl.create(:user, card_infos: [FactoryGirl.create(:card_info, discard: true)])).should be_nil
    end

    it "should return active card number" do
      active_card = FactoryGirl.create(:card_info, discard: false)
      active_card_number = active_card.card_number
      card_number_text(FactoryGirl.create(:user, card_infos: [FactoryGirl.create(:card_info, discard: true), active_card])).should eql(active_card_number)
    end
  end
end
