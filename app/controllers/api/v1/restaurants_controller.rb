class Api::V1::RestaurantsController < Api::V1::ApplicationController

  def index
    @restaurants = Restaurant.all

    paginate json: @restaurants, per_page: 10
  end

end
