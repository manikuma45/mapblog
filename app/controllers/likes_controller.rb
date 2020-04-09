class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(blog_id: params[:blog_id])
    @blog = @like.blog
  end

  def destroy
    @like = Like.find(params[:id]).destroy
    @blog = @like.blog
  end

  def index
    @user = User.find(params[:user_id])
    @blogs = @user.like_blogs.order(created_at: "DESC")
    @markers_json = @blogs.map do |blog|
      [
        blog.id,
        blog.lat,
        blog.lng,
        blog.content,
        blog.image.thumb.url,
        blog.user.icon.thumb.url,
      ]
    end.to_json
  end

  def users
    blog = Blog.find(params[:blog_id])
    @users = blog.like_users
  end
end
