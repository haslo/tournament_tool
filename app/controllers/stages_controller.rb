class StagesController < ApplicationController

  before_action :authenticate_account!

  expose(:stages) { current_account.stages }
  expose(:stage)
  expose(:tournament) { stage.tournament }

end
