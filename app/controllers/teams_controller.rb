class TeamsController < ApplicationController
  def index
    @teams = Team.includes(:players, :coach, :competitions).page(params[:page]).per(10)  # Display 10 teams per page
  end

  def show
    @team = Team.find(params[:id])
  end
end
