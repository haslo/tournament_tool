class StagesController < ApplicationController

  respond_to :html, :xml, :json

  before_action :authenticate_account!

  expose(:stages) { current_account.stages }
  expose(:stage, attributes: :stage_attributes)

  def new
    user_tournament = Tournament.find(params[:tournament_id])
    raise 'error' if user_tournament.account != current_account
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
                                  :tournament_id)
  end

end
