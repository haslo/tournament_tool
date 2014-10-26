class ParticipantsController < ApplicationController

  respond_to :html, :xml, :json

  before_action :authenticate_account!

  expose(:tournaments) { current_account.tournaments }
  expose(:participant, attributes: :participant_attributes)

  def create
    raise 'invalid tournament' unless tournaments.include?(participant.tournament)
    if participant.save
      flash[:notice] = I18n.t('messages.created', model: Participant.model_name)
    else
      flash[:alert] = participant.errors.inspect
    end
    redirect_to controller: :tournaments, action: :edit, id: participant.tournament.id, tab: 'signup'
  end

  def update
    raise 'invalid tournament' unless tournaments.include?(participant.tournament)
    if participant.save
      flash[:notice] = I18n.t('messages.updated', model: Participant.model_name)
    else
      flash[:alert] = participant.errors.inspect
    end
    redirect_to controller: :tournaments, action: :edit, id: participant.tournament.id, tab: 'signup'
  end

  def destroy
    raise 'invalid tournament' unless tournaments.include?(participant.tournament)
    participant.destroy
    flash[:alert] = I18n.t('messages.destroyed', model: Participant.model_name)
    redirect_to controller: :tournaments, action: :edit, id: participant.tournament.id, tab: 'signup'
  end

  private

  def participant_attributes
    params.require(:participant).permit(:tournament_id, :type, :first_name, :last_name, :email)
  end

end
