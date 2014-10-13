class TournamentsController < ApplicationController

  before_action :authenticate_account!, except: :show

  expose(:tournaments) { decorate_list(current_account.tournaments) }
  expose(:tournament)
  expose(:shown_tournament) { decorate(Tournament.find_by(show_key: params[:id])) }
  expose(:admin_tournament) { decorate(Tournament.find_by(admin_key: params[:id])) }

  expose(:edit_tabs) {
    [
      %w[signup edit],
      %w[register list],
      %w[schedule film],
      %w[run play],
      %w[info qrcode],
      %w[results random],
      %w[standings tasks],
    ]
  }
  expose(:show_tabs) {
    [
      %w[info qrcode],
      %w[results random],
      %w[standings tasks],
    ]
  }
  expose(:active_tab) { params[:tab] || (admin_tournament && 'signup' || shown_tournament && 'info') }

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
  end

  def edit
  end

  def update
  end

  def destroy
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

end
