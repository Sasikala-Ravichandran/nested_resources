class CommentsController < ApplicationController

  def index
    post = Post.find(params[:post_id])
    @comments = post.comments
  end

  def show
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
  end

  def new
    post = Post.find(params[:post_id])
    @comment = post.comments.build
  end

  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.new(comment_params)
    if @comment.save
      redirect_to([@comment.post, @comment])
    else
      render action: "new"
    end
  end
  
  def edit
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
  end

  def update
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])@comment.update(comment_params)
    redirect_to([@comment.post, @comment])
  end
	
  def destroy
    post = Post.find(params[:post_id])
    @comment = post.comments.find(params[:id])
    @comment.destroy
    flash.notice = "comment is deleted"
    redirect_to post
  end

  private

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
    
end