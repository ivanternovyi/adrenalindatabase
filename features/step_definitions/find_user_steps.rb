Then /^I have to see result\: ([0-9]*) record$/ do |c|
  page.should have_selector('div.record', count: c)
end