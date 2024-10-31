class PlayersController < ApplicationController
    def index
      @players = Player.includes(:team, :position, :coach, :competitions).page(params[:page]).per(10) # Display 10 players per page
      @teams = Team.all # Make sure @teams is set to avoid map being undefined
      @positions = Position.all # Make sure @positions is set
    end

  def show
    @player = Player.find(params[:id])
  end

  def search
    @teams = Team.all
    @positions = Position.all
    if params[:query].present?
      @players = Player.includes(:position, :team, :coach, :competitions)
                        .where("players.name LIKE ?", "%#{params[:query]}%").page(params[:page]).per(10)
    else
      @players = Player.includes(:position, :team, :coach, :competitions).all.page(params[:page]).per(10)
    end
     # Filter by team
     if params[:team_id].present?
      @players = @players.where(team_id: params[:team_id])
     end

    # Filter by position
    if params[:position_id].present?
      @players = @players.where(position_id: params[:position_id])
    end
    render :index # Render the index view after searching
  end
end
