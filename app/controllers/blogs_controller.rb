# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]
  before_action :set_blogs, only: %i[home index create]
  before_action :ensure_correct_user, only: %i[edit update destroy]
  before_action :authenticate_user!

  def home
    @markers_json = []
    Blog.all.each do |blog|
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

  def index; end

  def show
    @like = current_user.likes.find_by(blog_id: @blog.id)
  end

  def new
    @blog = Blog.new(
      lat: params[:latitude],
      lng: params[:longitude]
    )
  end

  def edit; end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to home_path
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to home_path
    else
      render :new
    end
  end

  def destroy
    @blog.destroy
    redirect_back(fallback_location: home_path)
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def set_blogs
    @blogs = Blog.all.order(created_at: 'DESC')
  end

  def blog_params
    params.require(:blog).permit(:content, :lat, :lng, :image)
  end

  def ensure_correct_user
    @blog = Blog.find(params[:id])
    redirect_to home_path unless @blog.user_id == current_user.id
  end
end
