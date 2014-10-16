class TournamentsController < ApplicationController

  respond_to :html, :xml, :json

  before_action :authenticate_account!, except: [:show]

  expose(:tournaments) { current_account.tournaments.order(tournament_start: :desc, id: :desc) }
  expose(:tournament, attributes: :tournament_attributes)
  expose(:shown_tournament) { Tournament.find_by(show_key: params[:id]) }

  expose(:new_tabs) {
    [
      %w[basic edit],
      %w[advanced check]
    ]
  }
  expose(:edit_tabs) {
    [
      %w[update home],
      %w[signup edit],
      %w[register list],
      %w[schedule calendar],
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
        tournament.valid? ? 'signup' : 'update'
      elsif shown_tournament.present?
        'info'
      else
        'basic'
      end
    end
  end

  before_filter :needs_show_key, only: [:show]

  def index
  end

  def show
  end

  def new
  end

  def create
    tournament.account_id = current_account.id
    if tournament.save
      flash[:notice] = I18n.t('messages.created', model: Tournament.model_name)
      redirect_to action: :edit, id: tournament
    else
      respond_with tournament
    end
  end

  def edit
  end

  def update
    if tournament.save
      flash[:notice] = I18n.t('messages.updated', model: Tournament.model_name)
      redirect_to action: :edit, tab: :signup, id: tournament
    else
      respond_with tournament
    end
  end

  def destroy
    tournament.destroy
    flash[:alert] = I18n.t('messages.destroyed', model: Tournament.model_name)
    redirect_to action: :index
  end

  private

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
