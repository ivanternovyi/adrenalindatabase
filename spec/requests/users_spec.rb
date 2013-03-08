require 'spec_helper'

describe "Users" do 
  include Capybara::DSL
  include Capybara::RSpecMatchers
  
  it "cause log in user" do
    visit '/'
    page.should have_content "Not authorized!"    
  end
end