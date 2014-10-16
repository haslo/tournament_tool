class TournamentsController < ApplicationController

  respond_to :html, :xml, :json

  before_action :authenticate_account!, except: [:show]
  before_action :verify_account, except: [:index, :show, :new, :create]

  expose(:tournaments) { current_account.tournaments }
  expose(:tournament)
  expose(:shown_tournament) { Tournament.find_by(show_key: params[:id]) }

  expose(:new_tabs) {
    [
      %w[basic edit],
      %w[advanced check]
    ]
  }
  expose(:edit_tabs) {
    [
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
  expose(:active_tab) do
    if params[:tab].present?
      params[:tab]
    else
      if Tournament.find_by(id: params[:id]).present?
        tournament.creation_completed? ? 'signup' : 'advanced'
      elsif shown_tournament.present?
        'info'
      else
        'basic'
      end
    end
  end

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
      redirect_to action: :edit, tab: :advanced, id: tournament
    else
      respond_with tournament
    end
  end

  def edit
  end

  def update
    tournament.assign_attributes(tournament_attributes)
    tournament.creation_completed = true
    if tournament.save
      redirect_to action: :edit, tab: :signup, id: tournament
    else
      respond_with tournament
    end
  end

  def destroy
    raise tournament.inspect
  end

  private

  def verify_account
    if tournament.account != current_account
      redirect_to action: :index
    end
  end

  def needs_show_key
    redirect_to(action: :index) if shown_tournament.nil?
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
