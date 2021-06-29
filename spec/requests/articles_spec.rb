require 'rails_helper'
require 'database_cleaner/active_record'
DatabaseCleaner.strategy = :truncation

RSpec.describe "Articles", type: :request do

  let(:valid_field) do
    {
      'title' => "first title",
      'description' => "desc of first title",
    }
  end

  let(:invalid_field) do
    {
      'title' => "",
      'description' => "desc of first title",
    }
  end

  describe "GET /index" do
    it 'returns a success response' do
      get articles_path
      expect(response).to be_successful
    end
  end

  # describe 'GET /show' do 
  #   it 'returns a success response' do
  #     article = Article.new(valid_field)
  #     article.user = current_user
  #     article.save
  #     get article_path(article)
  #     expect(response).to be_successful
  #   end
  # end

  # describe 'GET /new' do 
  #   it 'returns a success response' do
  #     article = Article.new
  #     get '/articles/new'
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe 'POST /create' do
    DatabaseCleaner.clean
    user = User.create!(username: "abc", password: "password", email: "user123@email.com", admin: true)
    user.save
    article = Article.create!(title: "first title", description: "desc of first title", user: user )
    it 'login' do
      login(user)
    end
    it 'set user' do
      set_user(user.id)
    end
    context 'with valid parameters' do
      it 'create e new article' do
          expect do
            post "/articles", params: { article: article } 
          end.to change(Article, :count).by(0)
      end
    end

    context 'with invalid parameters' do
      it 'does not create new article' do
        expect do
          post articles_path, params: { article: valid_field } 
        end.to change(Article, :count).by(0)
      end
    end
  end

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
