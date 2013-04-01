Given /^I am a (.+) with name "([^\"]*)", card number "([^\"]*)" and password "([^\"]*)"$/ do |user_name, name, card_number, pass|
  Role.find_by_name(user_name).should_not be(nil)
  usr = FactoryGirl.create(:user, password: pass, role_id: Role.find_by_name(user_name).id)
  usr.user_detail = FactoryGirl.create(:user_detail, name: name.split[0], surname: name.split[1], mid_name: name.split[2])
  usr.card_infos << FactoryGirl.create(:card_info, card_number: card_number)
end

When /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, with: value)
end

When /^I press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^I click "([^\"]*)"$/ do |link|
  click_link(link)
end

Then /^page should have text "([^\"]*)"$/ do |text|
  page.should have_content(text)
end