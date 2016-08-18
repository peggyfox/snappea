class Client < ApplicationRecord
  before_create :set_api_key

  def set_api_key
    self.api_key = generate_api_key
  end

  def generate_api_key
    loop do
      token = SecureRandom.urlsafe_base64(24)
      break token unless Client.exists?(api_key: token)
    end
  end
end
