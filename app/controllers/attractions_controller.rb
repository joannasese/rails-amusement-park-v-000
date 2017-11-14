class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
  end

  def show
    if logged_in?
      @attraction = Attraction.find(params[:id])
      @user = current_user
      # @user = User.find(params[:id])
      # @user = something
      # binding.pry

    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :tickets,
      :nausea_rating,
      :happiness_rating,
      :min_height
    )
  end


end
