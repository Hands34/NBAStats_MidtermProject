class PlayersController < ApplicationController
  def index
    @players = Player.includes(:team).order("points DESC")
  end

  def show
    @player = Player.find(params[:id])
  end
end
