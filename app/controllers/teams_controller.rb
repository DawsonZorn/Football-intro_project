class TeamsController < ApplicationController
  def index
    if params[:query].present?
      @teams = Team.where("name LIKE ?", "%#{params[:query]}%") # search form filter test
    else
      @teams = Team.all
    end
  end

  def show
    @team = Team.find(params[:id])
  end
end
