Given /^trip rules:$/ do |table|
  tab = table.raw
  tab.each{ |t| ttr = TripRule.create(name: t[0]) 
    ttr.save }
end 