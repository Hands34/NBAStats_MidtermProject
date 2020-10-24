class PlayersController < ApplicationController
  def index
    @players = Player.includes(:team).order("points DESC")
  end

  def show
    @player = Player.find(params[:id])
  end
  # The @movie variable will be shared with :
  # app/views/movies/show.html.erb

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @players = Player.where("full_name LIKE ?", wildcard_search)
  end
  # @movies variable will be shared with:
  # app/views/moves/search.html.erb
end
