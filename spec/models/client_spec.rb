require 'rails_helper'

RSpec.describe Client, :type => :model do

  describe "set_api_key" do
    it "sets the api key on the user on create" do
      c = Client.create

      expect(c.api_key).not_to be(nil)
    end
  end

  describe "generate_api_key" do
    it "returns a 32 character string" do
      expect(Client.new.generate_api_key.length).to eq(32)
    end

    it "returns a uniq string" do
      c = Client.create
      expect(Client.new.generate_api_key).not_to eq(c.api_key)
    end
  end
end
