class SessionsController < ApplicationController
  skip_before_action :require_current_user

  def create
    if params[:success]
      user = User.from_auth(request.env["omniauth.auth"])
      cookies[:user_id] = user.id
    end

    redirect_to request.env["omniauth.origin"] || root_path
  end

  def destroy
    cookies.delete(:user_token)

    redirect_to root_path
  end
end
