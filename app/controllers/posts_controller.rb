class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_post, only: [:show, :edit, :update, :destroy]
  def new
    @post = Post.new
  end
  def index
    @posts = Post.all
    @post = Post.new
  end
  def show
  end
  def edit
  end
  def create
    @post = Post.new posts_param
    respond_to do |format|
      if @post.save
        format.html {redirect_to @post, notice: "Post was successfully created."}
        format.json { render :show, status: :created, location: @post }
        format.js
      else
        format.html {render :new}
        format.json {render json: @post.errors, status: :unprocessable_entity}
        format.js
      end
    end
  end

  def update
   respond_to do |format|
      if @post.update posts_param
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
  def load_post
    @post = Post.find_by id: params[:id]
  end
  def posts_param
    params.require(:post).permit :title, :content, :user_id
  end
end
