require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  let(:valid_field) do
    {
      'username' => "bhumit",
      'password' => "123456",
      'email' => "user123@email.com"
    }
  end

  let(:invalid_field) do
    {
      'username' => "",
      'password' => "password",
      'email' => "user123@email.com"
    }
  end

  describe "GET /new" do
    it 'returns a success response' do
      get "/login"
      expect(response).to be_successful
    end
  end


  describe "POST /create" do
    it 'returns a success response' do
      user = User.new(valid_field)
      user.save
      post "/login", params: { session: valid_field }
      expect(response).to be_successful
    end
  end
end
