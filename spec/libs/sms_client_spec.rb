require 'spec_helper'

describe SmsClient do
  before(:each) do
    @api_key = 'api_key_test'
    @sender_name = 'sender name'
    @sms = SmsClient.new(@api_key, @sender_name)
  end
  
  it "should create right xml for require balance" do
    @sms.get_balance.should include("<balance></balance>")
  end

  it "should create few messages for send to serverr" do
    numbers = Array.new
    numbers << "+380672653212"
    numbers << "+380653284033"
    msg_text = 'test words'
    @sms.send_sms(numbers, msg_text).should include(
      '<msg recipient="' << numbers[0] <<'" sender="' << @sender_name << '" type="0">' << msg_text << '</msg>',
      '<msg recipient="' << numbers[1] <<'" sender="' << @sender_name << '" type="0">' << msg_text << '</msg>'
       )
  end
end
