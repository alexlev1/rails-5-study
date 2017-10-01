class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Пост успешно создан'
    else
      flash.now[:danger] = "Статья не создана"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Пост успешно обновлен'
    else
      flash.now[:danger] = "Статья не обновлена"
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Пост успешно удален'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :all_tags, :summary, :body, :image)
  end
end
