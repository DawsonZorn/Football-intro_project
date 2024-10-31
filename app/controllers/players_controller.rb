class PlayersController < ApplicationController
    def index
      @players = Player.includes(:team, :position, :coach, :competitions).page(params[:page]).per(10) # Display 10 players per page
    end

  def show
    @player = Player.find(params[:id])
  end

  def search
    if params[:query].present?
      @players = Player.includes(:position, :team, :coach, :competitions)
                        .where("players.name LIKE ?", "%#{params[:query]}%").page(params[:page]).per(10)
    else
      @players = Player.includes(:position, :team, :coach, :competitions).all.page(params[:page]).per(10)
    end
    render :index # Render the index view after searching
  end
end
