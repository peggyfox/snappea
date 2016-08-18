class Api::V1::ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  protected

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @current_user = Client.find_by(api_key: token)
    end
  end
end
