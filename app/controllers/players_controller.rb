class PlayersController < ApplicationController
  def index
    def index
      @players = Player.includes(:team, :position, :coach).all
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def search
    if params[:query].present?
      @players = Player.joins(:team, :coach)
                       .where("players.name LIKE ?", "%#{params[:query]}%")
                       .or(Player.joins(:team, :coach).where("teams.name LIKE ?", "%#{params[:query]}%"))
                       .includes(:team, :position, :coach)
    else
      @players = Player.includes(:team, :position, :coach).all
    end
    render :index
  end
end
