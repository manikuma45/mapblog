class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(blog_id: params[:blog_id])
    @blog = @like.blog
    @likes_count = Like.where(blog_id: @blog.id).count
  end

  def destroy
    @like = Like.find(params[:id]).destroy
    @blog = @like.blog
    @likes_count = Like.where(blog_id: @blog.id).count
  end
end
