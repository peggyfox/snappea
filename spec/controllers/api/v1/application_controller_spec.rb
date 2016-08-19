require 'rails_helper'

RSpec.describe Api::V1::ApplicationController, :type => :controller do

  controller(Api::V1::ApplicationController) do
    def index
      render json: {}
    end
  end

  describe "authenticate" do
    context "no api key" do
      it "returns 401" do
        get :index
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "an invalid api key" do
      it "returns 401" do
        request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials("randomstring")

        get :index
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "an invalid api key" do
      it "returns 200" do
        c = create(:client)
        request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(c.api_key)

        get :index
        expect(response).to have_http_status(:ok)
      end
    end
  end

end
