class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :destroy]
  before_action :set_blogs, only: [:home, :index, :create]
  before_action :ensure_correct_user, only: [:destroy]
  before_action :authenticate_user!

  def home
    @markers_json = Blog.all.map do |blog|
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

  def index
  end

  def show
    @like = current_user.likes.find_by(blog_id: @blog.id)
  end

  def new
    @blog = Blog.new(
      lat: params[:latitude], 
      lng: params[:longitude],
    )
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to root_url
    else
      render :new, notice: 'Blog was successfully created.' 
    end
  end

  def destroy
    @blog.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def set_blogs
    @blogs = Blog.all.order(created_at: "DESC")
  end

  def blog_params
    params.require(:blog).permit(:content, :lat, :lng, :image)
  end

  def ensure_correct_user
    @blog = Blog.find(params[:id])
    unless @blog.user_id == current_user.id
      redirect_to root_path
    end
  end
end
