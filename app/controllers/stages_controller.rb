class StagesController < ApplicationController

  respond_to :html, :xml, :json

  before_action :authenticate_account!

  expose(:tournaments) { current_account.tournaments }
  expose(:stages) { current_account.stages }
  expose(:stage, attributes: :stage_attributes)

  def new
    user_tournament = tournaments.find(params[:tournament_id])
    stage.tournament = user_tournament
  end

  def create
    if stage.save
      flash[:notice] = I18n.t('messages.created', model: Stage.model_name)
      redirect_to controller: :tournaments, action: :edit, id: stage.tournament.id, tab: 'schedule'
    else
      respond_with stage
    end
  end

  def edit
  end

  def update
    if stage.save
      flash[:notice] = I18n.t('messages.updated', model: Stage.model_name)
      redirect_to controller: :tournaments, action: :edit, id: stage.tournament.id, tab: 'schedule'
    else
      respond_with stage
    end
  end

  def destroy
    stage.destroy
    flash[:alert] = I18n.t('messages.destroyed', model: Stage.model_name)
    redirect_to controller: :tournaments, action: :edit, id: stage.tournament.id, tab: 'schedule'
  end

  private

  def stage_attributes
    params.require(:stage).permit(:type,
                                  :tournament_id,
                                  :title,
                                  :number_of_rounds,
                                  :minutes_per_round,
                                  :doors_open_time,
                                  :stage_start_time,
                                  :stage_end_time)
  end

end
