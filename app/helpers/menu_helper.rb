module MenuHelper

  def top_menu_items(view)
    [
      [tournaments_path, view.t('.menu.tournaments'), view.request.path_info =~ /\A\/([^\/]{11}|[^\/]{27}|)(\/edit|)\Z/],
      [about_path, view.t('.menu.about'), view.request.path_info == '/about'],
    ]
  end

end
