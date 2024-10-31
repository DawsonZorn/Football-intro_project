class CoachesController < ApplicationController
  def index
    @coaches = Coach.includes(:team).all
  end

  def show
    @coach = Coach.find(params[:id])
  end
end
