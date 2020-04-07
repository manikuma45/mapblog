class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.order(created_at: "DESC")
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
