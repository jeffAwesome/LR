class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :destroy]
  def create
    @post = Post.find(params[:comments][:post_id])
    @comment = Comments.new(comments_params)
    @comment.user_id = @post.user_id
    @comment.save
    @comment.create_activity :create, owner: current_user
    redirect_to @post
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def comments_params
    params.require(:comments).permit(:post_id, :user_id, :content)
  end
end
