class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]

    def new
        @user = User.new
    end
    def login
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            flash[:success] = "You have successfully logged in "
            redirect_to root_path
        else
            flash.now[:error] = "You have entered one or more things wrong!! "
            render :new
        end
    end

    def destroy
        if logged_in?
            @user = User.find(session[:user_id])
            session[:user_id] = nil
            flash[:success] = "You have successfully logged out "
            redirect_to login_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
    
    def logged_in_redirect
        if logged_in?
            flash[:error] = "You are already logged in"
            redirect_to root_path
        end
    end
end