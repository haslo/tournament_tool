module MenuHelper

  def top_menu_items(view)
    [
      [:get, tournaments_path, view.t('.tournaments'), view.request.path_info =~ /\A\/([^\/]{11}|[^\/]{27}|)(\/edit|)\Z/],
      [:get, about_path, view.t('.about'), view.request.path_info == '/about'],
    ]
  end

  def right_menu_items(view)
    if account_signed_in?
      [
        [:get, edit_account_registration_path, view.t('.profile'), view.request.path_info =~ /\A\/account/],
        [:delete, destroy_account_session_path, view.t('.logout'), false]
      ]
    else
      [
        [:get, new_account_registration_path, view.t('.sign_up'), view.request.path_info =~ /\A\/account.*up\Z/],
        [:get, new_account_session_path, view.t('.login'), view.request.path_info =~ /\A\/account.*in\Z/]
      ]
    end
  end

end
