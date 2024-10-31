class SeasonsController < ApplicationController
  def index
  end

  def show
    @season = Season.find(params[:id])
    @matches = @season.matches.includes(:team1, :team2)
  end
end
