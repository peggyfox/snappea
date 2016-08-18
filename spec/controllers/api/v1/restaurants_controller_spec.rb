require 'rails_helper'

RSpec.describe Api::V1::RestaurantsController, :type => :controller do

  before(:each) do
    @r = create(:restaurant, name: "Portillos", description: "Family retaurant", rating: 5, address: "100 W Ontario St, Chicago, IL 60654")
    http_token_auth
  end

  describe "GET index" do
    it "returns all restaurants" do
      get :index
      restaurants = JSON.parse(response.body)
      expect(restaurants.length).to eq(1)
    end

    it "has a name" do
      get :index
      restaurants = JSON.parse(response.body)
      expect(restaurants.first["name"]).to eq(@r.name)
    end

    it "has a description" do
      get :index
      restaurants = JSON.parse(response.body)
      expect(restaurants.first["description"]).to eq(@r.description)
    end

    it "has a rating" do
      get :index
      restaurants = JSON.parse(response.body)
      expect(restaurants.first["rating"]).to eq(@r.rating)
    end

    it "has a address" do
      get :index
      restaurants = JSON.parse(response.body)
      expect(restaurants.first["address"]).to eq(@r.address)
    end

    it "paginates the response" do
      7.times { Restaurant.create }

      get :index
      page1 = JSON.parse(response.body)

      expect(page1.length).to eq(5)
      expect(response.headers["Per-Page"]).to eq("5")
      expect(response.headers["Total"]).to eq(Restaurant.count.to_s)

      get :index, page: 2
      page2 = JSON.parse(response.body)
      expect(page2.length).to eq(Restaurant.count - 5)
    end

  end

end
