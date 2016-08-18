class Api::V1::RestaurantsController < Api::V1::ApplicationController

  def index
    @restaurants = Restaurant.all

    render json: @restaurants
  end

end
