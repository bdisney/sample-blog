class CommentsController < ApplicationController

before_filter :authenticate_user!, only: [:create]

def create
  @article = Article.find(params[:article_id])
  @new_comment = @article.comments.new(comment_params)
  @new_comment.user_id = current_user.id
  @new_comment.save!
  
  redirect_to article_path(@article)
end

private
  def comment_params
      params.require(:comment).permit(:user_id, :body)
  end

end
