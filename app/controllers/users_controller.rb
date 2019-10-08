class UsersController < ApplicationController
  before_action :login_Restriction,{only: [:edit,:update,:destroy,:logout]}
  before_action :Now_login_Restriction,{only: [:create,:new,:login,:login_form]}
  before_action :Authority_user,{only: [:edit,:update]}
  def new
      @user=User.new
  end
  def create
      @user=User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "unknown.jpeg"
      )
      if @user.save
         flash[:notice] ="ユーザーの登録ができました"
         redirect_to("/post/index")
      else
         render("users/new")
      end
  end
  def index
    @user=User.all
  end
  def show
    @user = User.find_by(id: params[:id])
  end
  def edit
     @user = User.find_by(id: params[:id])
  end
  def update
      @user = User.find_by(id: params[:id])
      @user.name = params[:name]
      @user.email = params[:email]
      if params[:image]
         @user.image_name ="#{@user.id}.jpg"
         image = params[:image]
         File.binwrite("public/users_image/#{@user.image_name}",image.read)
      end

      if @user.save
        flash[:notice] ="ユーザーの編集ができました"
        redirect_to("/users/#{@user.id}")
      else
        render("users/edit")
      end
  end
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    flash[:notice] ="ユーザーを削除しました"
    redirect_to("/users/index")
  end
  def login_form

  end
  def login
    @user =User.find_by(email: params[:email],password: params[:password])
    if @user
        session[:user_id] =@user.id
        flash[:notice] ="ログインしました"
        redirect_to("/users/#{@user.id}")
    else
        @error_message = "パスワードかメールアドレスが間違っていました"
        @email = params[:email]
        @password = params[:password]
        render("/users/login_form")
    end
  end
  def logout
    session[:user_id] = nil
    flash[:notice] ="ログアウトしました"
    redirect_to("/login")
  end
  def Authority_user
    if @current_user.id != params[:id].to_i 
        flash[:notice] ="権限がありません"
        redirect_to("/post/index")
    end
  end
end
