class HomeController < ApplicationController

  expose(:shown_tournament) { Tournament.find_by(show_key: params[:id]) || Tournament.find_by(admin_key: params[:id]) }
  expose(:admin_tournament) { Tournament.find_by(admin_key: params[:id]) }

  before_filter :redirect_for_tournament

  def index
    # noop
  end

  def show
    redirect_to action: :index
  end

  private

  def redirect_for_tournament
    if shown_tournament.present?
      if admin_tournament.present?
        redirect_to controller: :tournaments, action: :edit, id: params[:id]
      else
        redirect_to controller: :tournaments, action: :show, id: params[:id]
      end
    end
  end

end
