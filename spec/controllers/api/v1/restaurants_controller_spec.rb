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

      get :index
      restaurants = JSON.parse(response.body)
      expect(restaurants.first["name"]).to eq(name)
    end

    it "has a description" do
      description = "Family restaurant."
      r = create(:restaurant, description: description)

      get :index
      restaurants = JSON.parse(response.body)
      expect(restaurants.first["description"]).to eq(description)
    end

    it "has a rating" do
      rating = 5
      r = create(:restaurant, rating: rating)

      get :index
      restaurants = JSON.parse(response.body)
      expect(restaurants.first["rating"]).to eq(rating)
    end

    it "has a address" do
      address = "100 W Ontario St, Chicago, IL 60654"
      r = create(:restaurant, address: address)

      get :index
      restaurants = JSON.parse(response.body)
      expect(restaurants.first["address"]).to eq(address)
    end

    it "paginates the response" do
      12.times { Restaurant.create }

      get :index
      page1 = JSON.parse(response.body)

      expect(page1.length).to eq(10)
      expect(response.headers["Per-Page"]).to eq("10")
      expect(response.headers["Total"]).to eq("12")

      get :index, page: 2
      page2 = JSON.parse(response.body)
      expect(page2.length).to eq(2)
    end

  end

end
