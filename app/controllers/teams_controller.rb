class TeamsController < ApplicationController
  def index
    @teams = Team.select("teams.*")
                 .select("COUNT(teams.id) as player_count")
                 .left_joins(:players)
                 .group("teams.id")
                 .order("player_count DESC")
  end

  def show
    @team = Team.find(params[:id])
  end
end
