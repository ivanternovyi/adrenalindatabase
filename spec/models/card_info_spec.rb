require 'spec_helper'

describe CardInfo do
  describe "card number" do
    it "should not be valid without card number" do
      FactoryGirl.build(:card_info, card_number: nil).should_not be_valid
    end

    it "should not be valid with wrong card number" do
      FactoryGirl.build(:card_info, card_number: '23d1').should_not be_valid
      FactoryGirl.build(:card_info, card_number: '233331').should_not be_valid
      FactoryGirl.build(:card_info, card_number: '331').should_not be_valid
    end

    it "should be valid with right data" do
      FactoryGirl.build(:card_info).should be_valid
    end

    it "should be unique" do
      card_num = FactoryGirl.create(:card_info).card_number
      FactoryGirl.build(:card_info, card_number: card_num).should_not be_valid
    end

    it "should be save with valid data" do
      count = CardInfo.all.count
      FactoryGirl.create(:card_info)
      CardInfo.all.count.should be(count + 1)
    end

    it "should get only active cards" do
      inactive = FactoryGirl.create(:card_info, discard: true)
      CardInfo.active_cards.should_not include(inactive)
    end
  end
end
