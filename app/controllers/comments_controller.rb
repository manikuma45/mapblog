class CommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comments = @comment.blog.comments.order(created_at: 'DESC')
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to home_path , notice: '投稿できませんでした' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end
end
