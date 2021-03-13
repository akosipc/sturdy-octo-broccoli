class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = current_user.posts
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: "Successfully created a new post"
    else
      flash[:alert] = "There are errors encountered"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Successfully updated a post" 
    else
      flash[:alert] = "There are errors encountered"
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path, notice: "Successfully deleted a post"
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :published)
  end
end
