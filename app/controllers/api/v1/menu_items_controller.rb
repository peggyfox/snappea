class Api::V1::MenuItemsController < Api::V1::ApplicationController

  def index
    @menu_items = MenuItem.where(restaurant_id: params[:restaurant_id])

    render json: @menu_items
  end

end
