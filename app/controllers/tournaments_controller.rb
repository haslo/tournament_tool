class TournamentsController < ApplicationController

  respond_to :html, :xml, :json

  before_action :authenticate_account!, except: [:show, :edit]

  expose(:tournaments) { current_account.tournaments }
  expose(:tournament)
  expose(:shown_tournament) { Tournament.find_by(show_key: params[:id]) }
  expose(:admin_tournament) { Tournament.find_by(admin_key: params[:id]) }

  expose(:new_tabs) {
    [
      %w[basic edit],
      %w[advanced check]
    ]
  }
  expose(:edit_tabs) {
    [
      %w[info qrcode],
      %w[signup edit],
      %w[register list],
      %w[schedule film],
      %w[run play],
      %w[standings tasks]
    ]
  }
  expose(:show_tabs) {
    [
      %w[info qrcode],
      %w[results eye-open],
      %w[standings tasks]
    ]
  }
  expose(:active_tab) { params[:tab] || (admin_tournament && 'signup' || shown_tournament && 'info') || 'basic' }

  before_filter :needs_admin_key, except: [:index, :show, :new, :create]
  before_filter :needs_show_key, only: [:show]

  # TODO all actions :P

  def index
  end

  def show
  end

  def new
  end

  def create
    tournament.account_id = current_account.id
    tournament.attributes = tournament_attributes
    tournament.creation_completed = false
    if tournament.save
      redirect_to action: :edit, tab: :advanced, id: tournament.admin_key
    else
      respond_with tournament
    end
  end

  def edit
  end

  def update
    raise tournament.inspect
  end

  def destroy
    raise tournament.inspect
  end

  private

  def needs_admin_key
    if admin_tournament.nil?
      if shown_tournament.present?
        redirect_to(action: :show, id: params[:id])
      else
        redirect_to(action: :index)
      end
    end
  end

  def needs_show_key
    if shown_tournament.nil?
      if admin_tournament.present?
        redirect_to(action: :edit, id: params[:id])
      else
        redirect_to(action: :index)
      end
    end
  end

  def tournament_attributes
    params.require(:tournament).permit(:type,
                                       :title,
                                       :description,
                                       :doors_open_time,
                                       :tournament_start,
                                       :tournament_end,
                                       :signup_url)
  end

end
