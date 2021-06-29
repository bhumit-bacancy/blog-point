require 'rails_helper'
require 'database_cleaner/active_record'
DatabaseCleaner.strategy = :truncation

RSpec.describe "Users", type: :request do

  let(:valid_field) do
    {
      'username' => "abc",
      'password' => "password",
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

  describe "GET /index" do
    it 'returns a success response' do
      get users_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do 
    it 'returns a success response' do
      user = User.new(valid_field)
      user.save
      articles = user.articles
      get "/users/#{user.id}"
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do 
    it 'returns a success response' do
      get "/signup"
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it "create a new post" do
        expect do
          post users_path , params: { user: { username: "username", email: "email123@email.com", password: "password" } }
        end.to change(User, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create new user' do
        expect do
          post users_path, params: { user: invalid_field } 
        end.to change(User, :count).by(0)
      end
    end
  end

  describe 'GET /edit' do 
    DatabaseCleaner.clean
    user = User.create!(username: "abc", password: "password", email: "user123@email.com", admin: true)
    user.save
    it 'login' do
      login(user)
    end
    it 'set user' do
      set_user(user.id)
    end
    it 'render a successful response' do
      get "/users/#{user.id}", params: { id: user.id, user: user }       
    end
  end

  describe 'PUT /update' do
    DatabaseCleaner.clean
    user = User.create!(username: "abc", password: "password", email: "user123@email.com", admin: true)
    it 'login' do
      login(user)
    end
    context 'with valid parameters' do
      it 'update requested user' do
        user.username = "updated-name"
        user.save
        put "/users/#{user.id}", params: { user: { username: "updated-name", password: "password", email: "user123@email.com" } }
        expect(user.reload).to have_attributes(
          username: "updated-name", password: "password", email: "user123@email.com" 
        )
      end
    end
  end

end
