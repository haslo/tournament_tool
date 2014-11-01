require_relative 'page_object'

class Navbar < ::PageObject

  def visit_navigation_item(navbar_item)
    menu_item = find('ul.navbar-nav li', text: navbar_item)
    puts menu_item.inspect
    menu_item.click
  end

  def expect_navigation_item(navbar_item)
    menu_item = find('ul.navbar-nav li', text: navbar_item)
    expect(menu_item[:class]).to include('active')
  end

end
