class MatchesController < ApplicationController
  def search
    @matches = Match.joins(:team1, :team2).where("teams.name ILIKE ?", "%#{params[:query]}%")
  end

  def show_by_country
    @country = params[:country_name]
    @leagues = League.where(country: @country)
  end

  def show_by_league
    @league = League.find(params[:id])
    @seasons = @league.seasons
  end

  def show_by_season
    @season = Season.find(params[:id])
    @matches = @season.matches.includes(:team1, :team2)
  end
end
