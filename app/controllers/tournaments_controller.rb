class TournamentsController < ApplicationController

  expose(:tournaments)
  expose(:tournament)
  expose(:shown_tournament) { Tournament.find_by(show_key: params[:id]) || Tournament.find_by(admin_key: params[:id]) }
  expose(:admin_tournament) { Tournament.find_by(admin_key: params[:id]) }

  before_filter :needs_admin_key, except: [:index, :show, :new, :create]
  before_filter :needs_show_key, only: [:show]

  def index
    # TODO
  end

  def show
    # TODO
  end

  def new
    # TODO
  end

  def create
    # TODO
  end

  def edit
    # TODO
  end

  def update
    # TODO
  end

  def destroy
    # TODO
  end

  private

  def needs_admin_key
    unless admin_tournament.present?
      if shown_tournament.present?
        redirect_to(action: :show, id: params[:id])
      else
        redirect_to(action: :index)
      end
    end
  end

  def needs_show_key
    redirect_to(action: :index) unless shown_tournament.present?
  end

end
