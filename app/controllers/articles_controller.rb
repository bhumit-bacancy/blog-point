class ArticlesController < ApplicationController

    before_action :set_art, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :delete]

    def show
        @comments = @article.comments
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        @article = Article.new
    end

    def edit
    end

    def create
        byebug
        @article = Article.new(art_params)
        @article.user=current_user
        if @article.save
            flash[:notice] = "Atrical was created successfully."
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        if @article.update(art_params)
            flash[:notice] = "Atrical was updated successfully."
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        @article.destroy
        #@art.save
        redirect_to articles_path
    end

    private
    def set_art
        @article = Article.find(params[:id])
    end

    def art_params
        params.require(:article).permit(:title, :description, category_ids: [])
    end

    def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:alert] = "you can only edit/delete your articles"
            redirect_to @article
        end
    end

end