class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        @current_user ||= User.find_by_session_token(session[:session_token])
    end

    def log_in(user)
        @current_user = user
        @current_user.reset_session_token!
        session[:session_token] = @current_user.session_token
    end

    def logged_in?
        !!current_user
    end

    def log_out
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end

    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def require_moderator
        redirect_to subs_url unless is_moderator?
    end

    def is_moderator? 
        sub = Sub.find_by(id: params[:id])
        current_user == sub.moderator
    end
end
