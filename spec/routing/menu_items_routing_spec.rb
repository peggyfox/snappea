require "rails_helper"

RSpec.describe Api::V1::MenuItemsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/restaurants/1/menu_items").to route_to("api/v1/menu_items#index", restaurant_id: "1")
    end

  end
end
