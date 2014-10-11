module MenuHelper

  def top_menu_items(view)
    [
      [root_path, view.t('.menu.home'), view.request.path_info == '/'],
      [tournaments_path, view.t('.menu.tournaments'), view.request.path_info =~ /\A\/tournaments/],
      [about_path, view.t('.menu.about'), view.request.path_info == '/about'],
    ]
  end

end
