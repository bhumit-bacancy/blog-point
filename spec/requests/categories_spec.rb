require 'rails_helper'

RSpec.describe "Categories", type: :request do
  current_user = User.first_or_create(username: "User123", email: "user123@email.com", password: "password")
  current_user.admin = true
  let(:valid_field) do
    {
      'name' => "category"
    }
  end

  let(:invalid_field) do
    {
      'name' => ""
    }
  end

  describe "GET /index" do
    it 'returns a success response' do
      get categories_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do 
    it 'returns a success response' do
      category = Category.create(valid_field)
      artices = category.articles
      get "/categories/#{category.id}"
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do 
    it 'returns a success response' do
      category = Category.new
      get new_category_path
      # expect(response).to be_successful
    end
  end

  describe 'GET /edit' do 
    it 'returns a success response' do
      category = Category.create! valid_field
      get edit_category_path(category)
      # expect(response).to be_successful
    end
  end

  # describe 'POST /create' do
  #   context 'with valid parameters' do
  #     it 'create e new user' do
  #         expect do
  #           post users_path, params: { user: valid_field } 
  #         end.to change(User, :count).by(1)
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'does not create new user' do
  #       expect do
  #         post users_path, params: { user: invalid_field } 
  #       end.to change(User, :count).by(0)
  #     end
  #   end
  # end

  # describe 'PATCH /update' do
  #   context 'with valid parameters' do
  #     let(:new_field) do
  #       skip('add hash')
  #     end

  #     it 'update requested user' do
  #       user=User.create! valid_field
  #       patch user_path(user), params: { user: valid_field }
  #       user.reload
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'does not create e new user' do
  #       expect do
  #         post users_path, params: { user: invalid_field } 
  #       end.to change(User, :count).by(0)
  #     end
  #   end
  # end

  # describe 'DELETE /destroy' do
  #   it 'delete requested user' do
  #     user=User.create! valid_field
  #     expect do
  #       delete user_path(user) 
  #     end.to change(User, :count).by(-1)
  #   end
  # end

end
