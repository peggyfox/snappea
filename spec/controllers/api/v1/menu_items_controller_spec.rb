require 'rails_helper'

RSpec.describe Api::V1::MenuItemsController, :type => :controller do

  before(:each) do
    http_token_auth
  end

  describe "GET index" do
    it "returns all menu_items" do
      r = create(:restaurant)
      menu_item = MenuItem.create!(restaurant_id: r.id)

      get :index, params: {restaurant_id: r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.length).to eq(MenuItem.count)
    end

    it "has a name" do
      r = create(:restaurant)
      name = "hot dog"
      menu_item = MenuItem.create!(restaurant_id: r.id, name: name)

      get :index, params: {restaurant_id: r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.first["name"]).to eq(name)
    end

    it "has a description" do
      r = create(:restaurant)
      description = "Chicago-style Vienna beef hot dog."
      menu_item = MenuItem.create!(restaurant_id: r.id, description: description)

      get :index, params: {restaurant_id: r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.first["description"]).to eq(description)
    end

    it "has a category" do
      r = create(:restaurant)
      category = "Entree"
      menu_item = MenuItem.create!(restaurant_id: r.id, category: category)

      get :index, params: {restaurant_id: r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.first["category"]).to eq(category)
    end

    it "has tags" do
      r = create(:restaurant)
      menu_item = MenuItem.create!(restaurant_id: r.id, tag_list: ["vegan"])

      get :index, params: {restaurant_id: r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.first["tags"]).to include("vegan")
    end
  end

end
