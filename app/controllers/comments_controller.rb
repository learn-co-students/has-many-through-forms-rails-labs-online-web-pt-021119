class CommentsController < ApplicationController

  def create
    if params[:comment][:user_id].present? && params[:comment][:user_attributes][:username].present?
      redirect_to post_path(params[:comment][:post_id])
    else
      comment = Comment.create(comment_params)
      redirect_to post_path(comment_params[:post_id])
    end
  end

  private

  def comment_params
    if params[:comment][:user_id].present?
      params.require(:comment).permit(:content, :post_id, :user_id)
    elsif params[:comment][:user_attributes][:username].present?
      params.require(:comment).permit(:content, :post_id, user_attributes:[:username])
    end
  end
end
