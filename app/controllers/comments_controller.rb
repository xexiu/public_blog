class CommentsController < ApplicationController
  before_filter :get_parent
  
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all
  end
  
  def new
    @post = Post.find(params[:post_id])
    @comment = @parent.comments.create
  end
  
  def show
    @post = Post.find(params[:post_id])
    @comment = @parent.comments.find(params[:id])
  end

  def create
    @comment = @parent.comments.create(comment_params)
     
    if @comment.save
      redirect_to post_path(@comment.post), :notice => 'Thank you for your comment!'
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body, :parent_id, :captcha, :captcha_key)
  end
  
  def get_parent
    @parent = Post.find(params[:post_id]) if params[:post_id]
    @parent = Comment.find(params[:comment_id]) if params[:comment_id]
     
    redirect_to root_path unless defined?(@parent)
  end

end
