# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.order(created_at: 'DESC')
    @markers_json = []
    @blogs.each do |blog|
      blog_image = if blog.image?
                     blog.image.thumb.url
                   else
                     false
                   end

      @markers_json.push([
                           blog.id,
                           blog.lat,
                           blog.lng,
                           blog.content,
                           blog_image,
                           blog.user.icon.thumb.url
                         ])
    end.to_json
  end
end
