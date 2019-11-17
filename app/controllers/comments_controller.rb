class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to polymorphic_path(comment.root)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    if comment.update(comment_params)
      redirect_to polymorphic_path(comment.root)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @object = comment.object
    comment.destroy if current_user.comments.find_by(id: comment.id)
  end

  private

  def comment
    @comment ||= Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_id, :object_id, :object_type, :text)
  end
end
