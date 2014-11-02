class StagesController < ApplicationController

  respond_to :html, :xml, :json

  before_action :authenticate_account!

  expose(:tournaments) { current_account.tournaments }
  expose(:stages) { current_account.stages }
  expose(:stage, attributes: :stage_attributes)

  def new
    user_tournament = tournaments.find(params[:tournament_id])
    stage.tournament = user_tournament
    stage.minutes_per_round = user_tournament.default_minutes_per_round
    stage.minutes_per_break = user_tournament.default_minutes_per_break
  end

  def create
    if stage.save
      stage.tournament.update_stage_times
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
      stage.tournament.update_stage_times
      flash[:notice] = I18n.t('messages.updated', model: Stage.model_name)
      redirect_to controller: :tournaments, action: :edit, id: stage.tournament.id, tab: 'schedule'
    else
      respond_with stage
    end
  end

  def destroy
    tournament = stage.tournament
    stage.destroy
    update_stage_times(tournament)
    flash[:alert] = I18n.t('messages.destroyed', model: Stage.model_name)
    redirect_to controller: :tournaments, action: :edit, id: stage.tournament.id, tab: 'schedule'
  end

  private

  def stage_attributes
    params.require(:stage).permit(:type,
                                  :tournament_id,
                                  :title,
                                  :number_of_rounds,
                                  :maximum_number_of_participants,
                                  :minutes_per_round,
                                  :minutes_per_break,
                                  :stage_start,
                                  :stage_end)
  end

end
