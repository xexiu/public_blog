class CommentsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_filter :get_parent
  
  def index
    @post = Post.friendly.find(params[:post_id])
    @comments = @post.comments.all
  end
  
  def new
    @post = Post.friendly.find(params[:post_id])
    @comment = @parent.comments.create
  end
  
  def show
    @post = Post.friendly.find(params[:post_id])
    @comment = @parent.comments.find(params[:id])
  end

  def create
    @post = Post.friendly.find(params[:post_id])
    @comment = @parent.comments.create
    if simple_captcha_valid? || logged_in? && current_user
      @comment = @parent.comments.create(comment_params)
      redirect_to post_path(@comment.post)
      flash[:success] = "Comment successfully created!"
    else
      redirect_to :back
      flash[:danger] = "Invalid Captcha!"
    end
  end
  
  def edit
    @post = Post.friendly.find(params[:post_id])
    @comment = Comment.find(params[:comment_id]) if params[:comment_id] # Reply
    @comment = Comment.find(params[:id]) if params[:id] # Comment
  end
  
  def update
    @post = Post.friendly.find(params[:post_id])
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
    @post = Post.friendly.find(params[:post_id]) # Redirect back to post
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
    params.require(:comment).permit(:name, :body, :parent_id, :captcha, :captcha_key)
  end
  
  def get_parent
    @parent = Post.friendly.find(params[:post_id]) if params[:post_id]
    @parent = Comment.find(params[:comment_id]) if params[:comment_id]
    redirect_to root_path unless defined?(@parent)
  end
  
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @comment = Comment.find(params[:id])
    redirect_to(root_url) unless logged_in? && (current_user.admin? || @comment.name == current_user.name)
  end

end
