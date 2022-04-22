# frozen_string_literal: true

class SessionsController < BaseController
  def create
    user = User.login(params[:user])
    if user
      session[:tankyou] = user.id
      cookies[:tankyou] = user.id
      redirect_to root_path, notice: "登入成功#{session[:tankyou]}"
    else
      redirect_to sign_in_users_path, notice: '帳號密碼有錯'
    end
  end

  def destroy
    session[:tankyou] = nil
    redirect_to root_path, notice: '登出成功'
  end
end
