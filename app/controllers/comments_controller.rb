class CommentsController < ApplicationController

  def create
    if params[:comment][:user_id].empty?
      comment = Comment.create(comment_params(:content, :post_id, user_attributes:[:username]))
    else
      comment = Comment.create(comment_params(:content, :post_id, :user_id))
    end
    redirect_to comment.post
  end

  private

  def comment_params(*args)
    params.require(:comment).permit(*args)
  end
end
