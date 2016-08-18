require "rails_helper"

RSpec.describe Api::V1::RestaurantsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/restaurants").to route_to("api/v1/restaurants#index")
    end

  end
end
