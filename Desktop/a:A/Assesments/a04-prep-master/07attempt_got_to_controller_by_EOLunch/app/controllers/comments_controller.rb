class CommentsController < ApplicationController
  before_action :require_login
  def create
    comment = current_user.comments.new(comment_params)
    comment.link_id = params[:link_id]
    comment.save
    flash[:errors] = comment.errors.full_messages
    redirect_to link_url(comment.link_id)
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy
    redirect_to link_url(comment.link_id)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
