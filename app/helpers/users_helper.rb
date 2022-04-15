module UsersHelper
    def user_signed_in? 
        session[:tankyou].present?
    end

    def current_user
        User.find_by(id: session[:tankyou])
    end
end
