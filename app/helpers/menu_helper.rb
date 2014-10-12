module MenuHelper

  def top_menu_items(view)
    [
      [tournaments_path, view.t('.tournaments'), view.request.path_info =~ /\A\/([^\/]{11}|[^\/]{27}|)(\/edit|)\Z/],
      [about_path, view.t('.about'), view.request.path_info == '/about'],
    ]
  end

  def right_menu_items(view)
    if account_signed_in?
      [
        [edit_account_registration_path, view.t('.profile', email: current_account.email), view.request.path_info =~ /\A\/account/],
        [destroy_account_session_path, view.t('.logout'), false]
      ]
    else
      [
        [new_account_registration_path, view.t('.sign_up'), view.request.path_info =~ /\A\/account.*up\Z/],
        [new_account_session_path, view.t('.login'), view.request.path_info =~ /\A\/account.*in\Z/]
      ]
    end
  end

end
