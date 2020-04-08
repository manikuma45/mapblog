class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(blog_id: params[:blog_id])
    @blog = @like.blog
  end

  def destroy
    @like = Like.find(params[:id]).destroy
    @blog = @like.blog
  end
end
