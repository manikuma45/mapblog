class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.order(created_at: "DESC")
    @markers_json = []
    Blog.all.each do |blog|
      if blog.image?
        blog_image = blog.image.thumb.url
      else
        blog_image = false
      end

      @markers_json.push([
          blog.id,
          blog.lat,
          blog.lng,
          blog.content,
          blog_image,
          blog.user.icon.thumb.url,
      ])
    end.to_json
  end
end
