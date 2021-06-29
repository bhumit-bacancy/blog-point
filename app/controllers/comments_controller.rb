class CommentsController < ApplicationController
    before_action :require_user, except: [:showx]
    before_action :require_same_user, only: [:edit, :update, :delete]

    def show
        @comment = Comment.find(params[:id])
    end
    
    def index
        redirect_to articles_path
    end

    def new
        @comment = Comment.new()
    end

    def create
        @comment = Comment.new(description: params[:comment][:description], article_id: params[:comment][:article_id] )
        @comment.user= current_user
        if @comment.save
            flash[:notice] = "comment added"
            redirect_to article_path(@comment.article)
        else
            render 'new'
        end
    end

    def edit
        @comment = Comment.find(params[:id])
    end

    def update
        @comment = Comment.find(params[:id])
        @comment.update(description: params[:comment][:description])
        @comment.save
        flash[:notice] = "successfully saved"
        redirect_to article_path(@comment.article)
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
            flash[:notice] = "comment was successfully deleted"
            redirect_to article_path(@comment.article)
        else
            flash[:notice] = "something went wrong, try later"
        end
        
    end

    private
    def comment_params
        params.require(:article).permit(:description,:article_id)
    end

    def require_same_user
        if  current_user != Comment.find(params[:id]).user && !current_user.admin?
            flash[:alert] = "you can only edit/delete your articles"
            redirect_to articles_path
        end
    end
end