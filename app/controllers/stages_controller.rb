class StagesController < ApplicationController

  respond_to :html, :xml, :json

  before_action :authenticate_account!

  expose(:stages) { current_account.stages }
  expose(:stage)
  expose(:tournament) { stage.tournament }

  def new
  end

  def create
    if stage.save
      flash[:notice] = I18n.t('messages.created', model: Stage.model_name)
      redirect_to controller: :tournaments, action: :edit, id: tournament, tab: 'schedule'
    else
      respond_with tournament
    end
  end

  def edit
  end

  def update
    if stage.save
      flash[:notice] = I18n.t('messages.updated', model: Stage.model_name)
      redirect_to controller: :tournaments, action: :edit, id: tournament, tab: 'schedule'
    else
      respond_with stage
    end
  end

  def destroy
    stage.destroy
    flash[:alert] = I18n.t('messages.destroyed', model: Stage.model_name)
    redirect_to controller: :tournaments, action: :edit, id: tournament, tab: 'schedule'
  end
  private

  def stage_attributes
    params.require(:stage).permit(:type,
                                  :title,
                                  :description,
                                  :doors_open_time,
                                  :tournament_start,
                                  :tournament_end,
                                  :signup_url)
  end

end
