class PostsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit

  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
