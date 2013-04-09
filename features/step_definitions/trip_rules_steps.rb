Given /^trip rules:$/ do |table|
  tab = table.raw
  tab.each{ |t| TripRule.create!(name: t) }
end 