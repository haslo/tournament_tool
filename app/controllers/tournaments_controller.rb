class TournamentsController < ApplicationController

  respond_to :html, :xml, :json

  before_action :authenticate_account!, except: [:show]
  before_filter :needs_show_key, only: [:show]

  expose(:tournaments) { current_account.tournaments.order(tournament_start: :desc, id: :desc) }
  expose(:tournament, attributes: :tournament_attributes)
  expose(:shown_tournament) { Tournament.find_by(show_key: params[:id]) }

  expose(:edit_tabs) {
    [
      %w[update home],
      %w[signup edit],
      %w[schedule calendar],
      %w[register list],
      %w[run play],
      %w[info qrcode],
      %w[timeline time],
      %w[standings tasks]
    ]
  }
  expose(:show_tabs) {
    [
      %w[info qrcode],
      %w[guide eye-open],
      %w[timeline time],
      %w[standings tasks]
    ]
  }
  expose(:active_tab) do
    active_tab = nil
    if params[:tab].present?
      tabs = __send__("#{params[:action]}_tabs").map{|t|t[0]}
      active_tab = params[:tab] if tabs.include?(params[:tab])
    end
    if active_tab.nil?
      if Tournament.find_by(id: params[:id]).present?
        tournament.valid? ? 'signup' : 'update'
      elsif shown_tournament.present?
        'info'
      end
    else
      active_tab
    end
  end

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

  def sort
    params[:stage].each_with_index do |id, index|
      tournaments.find(params[:id]).stages.find(id).update_attribute(:position, index + 1)
    end
    render nothing: true
  end

  def default_stages
    flash[:alert] = 'not implemented yet'
    redirect_to action: :edit, tab: :schedule, id: params[:id]
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
