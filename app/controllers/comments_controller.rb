class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.create(comment_params)
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id, user_attributes: [:username])
  end
end

#models create the associations
#accepts_nested_attributes_for creates the methods (.username)
#when adding user_id or user_attributes, the association will be created in the database; no explict method should be created otherwise will create duplicate
