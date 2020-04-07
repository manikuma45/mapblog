class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs
    @markers_json = @blogs.map do |blog|
      [
        blog.id,
        blog.lat,
        blog.lng,
        blog.content,
        blog.image.url
      ]
    end.to_json
  end
end
