# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include UsersHelper
  def authenticate_user?
    redirect_to sign_in_users_path unless user_signed_in?
  end
end
