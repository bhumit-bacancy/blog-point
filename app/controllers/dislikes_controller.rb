class DislikesController < ApplicationController
   before_action :find_post_and_comment
   def create
      if logged_in?
         if already_liked?
            flash[:notice] = "You can do only like or dislike"
         else
            if already_disliked?
               flash[:notice] = "You can't dislike more than once"
            else
               @dislike=Dislike.create(article: @article,comment:@comment,user:current_user)
               @dislike.save
            end
         end
      else
         flash[:notice] = "log-in first"
      end
      redirect_to article_path(@article)
   end
  
   private

   def find_post_and_comment
      @article = Article.find(params[:article_id])
      @comment = Comment.find(params[:format])
   end

   def already_disliked?
      Dislike.where(user_id: current_user.id, article_id:
      params[:article_id], comment_id: params[:format]).exists?
   end

   def already_liked?
      Like.where(user_id: current_user.id, article_id:
      params[:article_id], comment_id: params[:format]).exists?
   end
end
