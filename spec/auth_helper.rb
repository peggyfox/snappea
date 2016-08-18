module AuthHelper
  def http_token_auth
    client = create(:client)
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(client.api_key)
  end

  def http_header_token
    client = create(:client)
    headers = {"HTTP_AUTHORIZATION" => client.api_key}
  end
end
