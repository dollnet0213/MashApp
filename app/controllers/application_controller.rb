class ApplicationController < ActionController::Base
    before_action :set_current_user

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end
    def login_Restriction
        if @current_user == nil
            flash[:notice] ="ログインが必要です"
            redirect_to("/login")
        end
    end
    def Now_login_Restriction
        if @current_user 
            flash[:notice] ="すでにログインしています"
            redirect_to("/post/index")
        end
    end
end
