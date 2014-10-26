class LeaguesController < ApplicationController

  respond_to :html, :xml, :json

  before_action :authenticate_account!

  expose(:leagues) { current_account.leagues }
  expose(:league)

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

end
