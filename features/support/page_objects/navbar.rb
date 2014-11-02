require_relative 'page_object'

class Navbar < ::PageObject

  def visit_navigation_item(navbar_item)
    find('ul.navbar-nav li', text: navbar_item).find('a').click
  end

  def expect_navigation_item(navbar_item)
    expect(find('ul.navbar-nav li.active', text: navbar_item)).to be_present
  end

end
