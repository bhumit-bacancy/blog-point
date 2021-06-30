class UsersController < ApplicationController
  def show
    user = User.find(params['id'])
    if user
      render json: {
        status: :success,
        user: user
        }
    else
      render json: {status: 401}
    end
  end

  def user_articles 
    user = User.find(params['id'])
    articles = user.articles
    if articles
      render json: {
        status: :success,
        articles: articles
      }
    else
      render json: { status: 401 }
    end
  end

  def change_password
    
    user = User.find(params['user']['id'])
    password = params['user']['old_password']
    new_password = params['user']['new_password']

    if (user.authenticate(password))
      user.password = new_password
      if user.save
        render json: {
          status: :success,
          user: user
          }
      else
        render json: {status: 401}
      end
    else
      render json: {status: 404}
    end
  end
end
