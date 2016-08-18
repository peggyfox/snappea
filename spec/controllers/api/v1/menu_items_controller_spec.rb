require 'rails_helper'

RSpec.describe Api::V1::MenuItemsController, :type => :controller do

  before(:each) do
    @r = create(:restaurant)
    @menu_item = create(:menu_item, restaurant_id: @r.id, name: "hot dog", description: "Chicago-style Vienna beef hot dog.", category: "Entree", tag_list: ["beef", "gluten"])

    http_token_auth
  end

  describe "GET index" do
    it "returns all menu_items" do
      get :index, params: {restaurant_id: @r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.length).to eq(MenuItem.count)
    end

    it "has a name" do
      get :index, params: {restaurant_id: @r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.first["name"]).to eq(@menu_item.name)
    end

    it "has a description" do
      get :index, params: {restaurant_id: @r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.first["description"]).to eq(@menu_item.description)
    end

    it "has a category" do
      get :index, params: {restaurant_id: @r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.first["category"]).to eq(@menu_item.category)
    end

    it "has tags" do
      get :index, params: {restaurant_id: @r.id}
      menu_items = JSON.parse(response.body)
      expect(menu_items.first["tags"]).to match(@menu_item.tag_list)
    end
  end

end
