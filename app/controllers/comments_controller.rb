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
      redirect_to post_path(@comment.post)
      flash[:success] = "Comment successfully created!"
    else
      redirect_to :back
      flash[:danger] = "Invalid Captcha!"
    end
  end
  
  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id]) if params[:comment_id] # Reply
    @comment = Comment.find(params[:id]) if params[:id] # Comment
  end
  
  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:comment_id]) if params[:comment_id] # Reply
    @comment = Comment.find(params[:id]) if params[:id] # Comment
    if @comment.update_attributes(comment_params)
      redirect_to post_path(@comment.post)
      flash[:success] = "Comment successfully updated!"
    else
      render 'edit'
      flash[:danger] = "Oops!! Errors found!! Comment can't be updated!"
    end
  end

  def destroy
    @post = Post.find(params[:post_id]) # Redirect back to post
    @comment = Comment.find(params[:comment_id]) if params[:comment_id] # Reply
    @comment = Comment.find(params[:id]) if params[:id] # Comment
    if @comment.destroy
      redirect_to post_path(@post)
      flash[:success] = "Comment successful deleted!"
    else
      flash[:danger] = "Oops!! Errors found!! Comment can't be delete!"
    end
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
