class PlayersController < ApplicationController
    def index
      @players = Player.includes(:team, :position, :coach, :competitions).all
    end

  def show
    @player = Player.find(params[:id])
  end

  def search
    if params[:query].present?
      @players = Player.includes(:position, :team, :coach, :competitions)
                        .where("players.name LIKE ?", "%#{params[:query]}%")
    else
      @players = Player.includes(:position, :team, :coach, :competitions).all
    end
    render :index # Render the index view after searching
  end
end
