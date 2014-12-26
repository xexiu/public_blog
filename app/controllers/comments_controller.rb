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
    if simple_captcha_valid? || current_user.admin?
      @post = Post.find(params[:post_id])
      @comment = @parent.comments.create(comment_params)
      redirect_to post_path(@comment.post), :notice => 'Thank you for your comment!'
    else
      redirect_to :back
      flash[:danger] = "Invalid Captcha!"
    end
  end

  def destroy
    @post = Post.find(params[:post_id]) # Redirect back to post
    @comment = Comment.find(params[:comment_id]) if params[:comment_id] # Reply
    @comment = Comment.find(params[:id]) if params[:id] # Comment
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body, :captcha, :captcha_key)
  end
  
  def get_parent
    @parent = Post.find(params[:post_id]) if params[:post_id]
    @parent = Comment.find(params[:comment_id]) if params[:comment_id]
     
    redirect_to root_path unless defined?(@parent)
  end

end
