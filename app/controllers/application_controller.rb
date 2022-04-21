class ApplicationController < ActionController::Base
include Pundit::Authorization
include UsersHelper
    def authenticate_user?
        if not user_signed_in?
            redirect_to sign_in_users_path
        end
    end
    
end
