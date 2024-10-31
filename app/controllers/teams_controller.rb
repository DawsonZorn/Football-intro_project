class TeamsController < ApplicationController
  def index
    @teams = Team.includes(:players, :coach, :competitions).all
  end

  def show
    @team = Team.find(params[:id])
  end
end
