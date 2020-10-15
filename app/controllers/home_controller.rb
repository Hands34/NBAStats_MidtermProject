class HomeController < ApplicationController
  def index
    @players = Player.includes(:team)
                     .order("points DESC")
                     .limit(10)

    @teams = Team.limit(10)
  end
end
