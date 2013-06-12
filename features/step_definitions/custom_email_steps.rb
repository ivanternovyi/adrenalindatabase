Then /^admins should receive an email with subject "([^\"]*)"$/ do | email_subject |
  # Check environment variables: if you don`t set, it couse errors
  ActionMailer::Base.deliveries.last.subject.should == email_subject
end