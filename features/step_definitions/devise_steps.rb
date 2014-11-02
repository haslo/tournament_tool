Given /^I am not authenticated$/ do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, "/accounts/sign_out", {}
  ensure
    Capybara.current_driver = current_driver
  end
end

Given /^I am a new, authenticated user$/ do
  email = 'logged@in.net'
  password = 'secretpass'
  Account.new(email: email, password: password, password_confirmation: password, confirmed_at: Time.zone.now).save!

  visit '/accounts/sign_in'
  fill_in 'account_email', :with => email
  fill_in 'account_password', :with => password
  click_button 'Log in'
end


When(/^I confirm my account through the link in the mail$/) do
  Account.all.each do |account|
    account.update_attribute(:confirmed_at, Time.zone.now)
  end
end
