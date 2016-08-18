require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, :type => :controller do
  before(:each) do
    http_token_auth
  end

  describe "GET index" do
    it "returns all restaurants" do
      restaurant = create(:restaurant)
      get :index
      restaurants = JSON.parse(response.body)
      expect(restaurants.length).to eq(1)
    end

    it "has a name" do
      name = "Portillos"
      r = create(:restaurant, name: name)

      get :index, params: {restaurant_id: r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.first["name"]).to eq(name)
    end

    it "has a description" do
      description = "Family restaurant."
      r = create(:restaurant, description: description)

      get :index, params: {restaurant_id: r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.first["description"]).to eq(description)
    end

    it "has a rating" do
      rating = 5
      r = create(:restaurant, rating: rating)

      get :index, params: {restaurant_id: r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.first["rating"]).to eq(rating)
    end

    it "has a address" do
      address = "100 W Ontario St, Chicago, IL 60654"
      r = create(:restaurant, address: address)

      get :index, params: {restaurant_id: r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.first["address"]).to eq(address)
    end
  end

end
