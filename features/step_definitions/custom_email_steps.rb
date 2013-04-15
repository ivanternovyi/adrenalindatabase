Then /^admins should receive an email with subject "([^\"]*)"$/ do | email_subject |
  ActionMailer::Base.deliveries.last.subject.should == email_subject
end