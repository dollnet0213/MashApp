class PostController < ApplicationController
  before_action :login_Restriction
  def new
      @post =Post.new
  end

  def create
      @post =Post.new(
        content: params[:content],
        title: params[:title],
        image_name: params[:image]
      )
      @post.user_id = @current_user.id

      if params[:image]
        @post.image_name = "#{@post.id}.jpg"
        image = params[:image]
        File.binwrite("public/post_image/#{@post.image_name}",image.read)
      end
      if @post.save
        flash[:notice] ="投稿をしました"
        redirect_to("/post/index")
      else
        render("/post/new")
      end
  end

  def index
      @post = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.save
      flash[:notice] ="投稿を編集しました"
      redirect_to("/post/index")
    else
      render("/post/edit")
    end
  end
  
  def destroy
      @post =Post.find_by(id: params[:id])
      @post.destroy
      flash[:notice] ="投稿を削除しました"
      redirect_to("/post/index")
  end
end
