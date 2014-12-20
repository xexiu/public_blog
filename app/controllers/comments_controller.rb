class CommentsController < ApplicationController

  def create
    if simple_captcha_valid?
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create(comment_params)
      redirect_to post_path(@post)
    else
      redirect_to :back
      flash[:danger] = "Invalid Captcha!"
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
    params.require(:comment).permit(:name, :body, :captcha, :captcha_key)
  end

end
