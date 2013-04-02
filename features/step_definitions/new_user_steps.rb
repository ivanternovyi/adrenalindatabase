# encoding: utf-8
When /^I select "([^\"]*)" to "(.*?)"$/ do |field, val|
  select val, from: 'user_town_office_id'
  # puts find('label', text: field)[:id]
end

When /^I select date "(.*?)" in "(.*?)"$/ do |val, field|
  select_date field, val
end

When /^I fill in "(.*?)" with "(.*?)" and set checkbox "(.*?)"$/ do |field, val, box|
  fill_in field, with: val
  set_checked field
end

When /^I fill jqueryfield in "(.*?)" with "(.*?)" and set checkbox "(.*?)"$/ do |field, val, box|
  find('#' + field).click()
  find('#' + field).native.send_keys(val)
  set_checked field
end

When /^I set checkbox "(.*?)"$/ do |key|
  check key
end