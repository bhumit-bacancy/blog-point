class ArticlesController < ApplicationController
  include CurrentUserConcern

  # before_action :set_art, only: [:show, :edit, :update, :destroy]
  # before_action :require_user, except: [:show, :index]
  # before_action :require_same_user, only: [:edit, :update, :delete]

  def show
    article = Article.find(params['id'])
    if article
      render json: {
        status: :success,
        article: article
        }
    else
      render json:{status: 401}
    end
  end

  def new 
    @art=Article.new
  end

  def index
    arts=Article.all
    if arts
      render json: {
      status: :success,
      articles: arts
      }
    else
      render json:{status: 401}
    end
  end

  def create
    art=Article.create!(title: params['article']['title'], description: params['article']['description'], user_id: params['article']['user_id'])
    if art.save
      render json: {
        status: :success,
        article: art
        }
    else
      render json: {status: 401}
    end
  end

  def update
    art=Article.find(params['id'])
    if art.update(title: params['article']['title'], description: params['article']['description'])
      render json: {
        status: :success,
        article: art
        }    
    else
      render json: {status: 401}
    end
  end

  def destroy
    art=Article.find(params['id'])
    if art.destroy
      render json: {status: 200}
    else
      render json: { status: 401}
    end

  end

  private

  def set_art
    art=Article.find(params[:id])
  end

  # def require_same_user
  #   if current_user != art.user 
  #     flash[:alert] = "you can only edit/delete your articles"
  #   end
  # end

end