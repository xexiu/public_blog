class PostsController < ApplicationController
  autocomplete :post, :title, :full => true
  autocomplete :tag, :name, :full => true # This will create an action autocomplete_brand_name on your controller, don't forget to add it on your routes file
  helper_method :index
  # before_action :logged_in_user, only: [:create, :destroy]
  # Allow the current user to delete his OWN entry
  # before_action :correct_user,   only: :destroy
  # Allow admins to delete all entries
  before_action :admin_user,     only: [:edit, :update, :destroy]

  def index
    if params[:tag]
      @posts_featured = Post.tagged_with(params[:tag]).featured
      @posts_unfeatured = Post.tagged_with(params[:tag]).unfeatured
    elsif params[:search]
      @posts_featured = Post.search(params[:search]).featured
      @posts_unfeatured = Post.search(params[:search]).unfeatured
    else
      @posts_featured = Post.all.featured
      @posts_unfeatured = Post.all.unfeatured
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)
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
  
  def upvote
    @post = Post.find(params[:id])
    if current_user
      respond_to do |format|
        unless current_user.voted_for? @post
          format.html { redirect_to :back }
          format.json { head :no_content }
          format.js { render :layout => false }
          @post.vote_total = @post.vote_total + 1
          @post.save
          @post.upvote_by current_user
        else
          flash[:danger] = 'You allready voted this entry'
          format.html { redirect_to :back }
          format.json { head :no_content }
          format.js
        end
      end
    else
      flash[:danger] = "You need to log in or sign up to vote!"
      redirect_to login_path
    end
  end

  def downvote
    @post = Post.find(params[:id])
    respond_to do |format|
      unless current_user.voted_for? @post
        format.html { redirect_to :back }
        format.json { head :no_content }
        format.js { render :layout => false }
        @post.vote_total = @post.vote_total + 1
        @post.save
        @post.downvote_by current_user
      else
        flash[:danger] = 'You allready voted this entry'
        format.html { redirect_to :back }
        format.json { head :no_content }
        format.js
      end
    end
  end

  def html_css
    #@posts = Post.all.order('created_at DESC').paginate(page: params[:page], :per_page => 10)
    @posts_featured = Post.all.featured
    @posts_unfeatured = Post.all.unfeatured
  end

  def javascript
    #@posts = Post.all.order('created_at DESC').paginate(page: params[:page], :per_page => 10)
    @posts_featured = Post.all.featured
    @posts_unfeatured = Post.all.unfeatured
  end

  def ruby
    #@posts = Post.all.order('created_at DESC').paginate(page: params[:page], :per_page => 10)
    @posts_featured = Post.all.featured
    @posts_unfeatured = Post.all.unfeatured
  end
  
  def void
    #@posts = Post.all.order('created_at DESC').paginate(page: params[:page], :per_page => 10)
    @posts_featured = Post.all.featured
    @posts_unfeatured = Post.all.unfeatured
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :categories, :featured_post, :all_tags)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
