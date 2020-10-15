class TeamsController < ApplicationController
  def index
    @teams = Team.ordered_by_players
  end

  def show
    @team = Team.find(params[:id])
  end
end
