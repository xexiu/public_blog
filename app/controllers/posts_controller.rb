class PostsController < ApplicationController
  helper_method :index
  # before_action :logged_in_user, only: [:create, :destroy]
  # Allow the current user to delete his OWN entry
  # before_action :correct_user,   only: :destroy
  # Allow admins to delete all entries
  before_action :admin_user,     only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order('created_at DESC').paginate(page: params[:page], :per_page => 10)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def html_css
    @posts = Post.all.order('created_at DESC').paginate(page: params[:page], :per_page => 10)
  end

  def javascript
    @posts = Post.all.order('created_at DESC').paginate(page: params[:page], :per_page => 10)
  end

  def ruby
    @posts = Post.all.order('created_at DESC').paginate(page: params[:page], :per_page => 10)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :categories, :bootsy_image_gallery_id)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
