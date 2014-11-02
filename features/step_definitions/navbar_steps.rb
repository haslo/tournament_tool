When(/^I visit the navbar item "(.*)"$/) do |navbar_item|
  navbar = Navbar.new(self)
  navbar.visit_navigation_item(navbar_item)
  navbar.expect_navigation_item(navbar_item)
end

When(/^I (?:can |)visit the tabs item "(.*)"$/) do |tabs_item|
  navbar = Navbar.new(self)
  navbar.visit_tabs_item(tabs_item)
  navbar.expect_tabs_item(tabs_item)
end

Then(/^the "(.*?)" tab should be active$/) do |tabs_item|
  navbar = Navbar.new(self)
  navbar.expect_tabs_item(tabs_item)
end
