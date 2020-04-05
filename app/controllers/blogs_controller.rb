class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :destroy]

  def home
    @blogs = Blog.all
    @markers_json = Blog.pluck(:id, :lat, :lng, :content).to_json
  end

  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new(
      lat: params[:latitude], 
      lng: params[:longitude],
    )
  end

  def create
    @blogs = Blog.all
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to home_url
    else
      render :new
    end
  end

  def destroy
    @blog.destroy
    redirect_to home_url
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:content, :lat, :lng)
  end
end