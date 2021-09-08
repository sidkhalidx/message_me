class ApplicationController < ActionController::Base
    def current_user
        current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user

    def logged_in?
        !!current_user
    end
    helper_method :logged_in?

    def require_user
        if !logged_in?
            flash[:error] = "You need to logged in to perform this action"
            redirect_to login_path
        end
    end
end
