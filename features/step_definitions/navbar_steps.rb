When(/^I visit the navbar item "(.*)"$/) do |navbar_item|
  navbar = Navbar.new(self)
  navbar.visit_navigation_item(navbar_item)
  navbar.expect_navigation_item(navbar_item)
end
