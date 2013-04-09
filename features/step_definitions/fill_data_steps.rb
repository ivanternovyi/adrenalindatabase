Given /^I add new date, fill in new date "(.*?)" with "(.*?)" and "(.*?)" with "(.*?)"$/ do |field1, val1, field2, val2|
  fill_in field1, with: val1
  fill_in field2, with: val2
end

When /^I set check box "([^\"]*)"$/ do |field|
  find(:css, "##{field}").set(true)
end