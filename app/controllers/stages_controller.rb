class StagesController < ApplicationController

  before_action :authenticate_account!

  expose(:stages) { current_account.stages }
  expose(:stage)
  expose(:tournament) { stage.tournament }

  def new
  end

  def create
    tournament.account_id = current_account.id
    tournament.attributes = tournament_attributes
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
    tournament.assign_attributes(tournament_attributes)
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

  def stage_attributes
    params.require(:tournament).permit(:type,
                                       :title,
                                       :description,
                                       :doors_open_time,
                                       :tournament_start,
                                       :tournament_end,
                                       :signup_url)
  end

end
