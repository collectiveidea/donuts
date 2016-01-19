class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_action :require_current_user

  private

  def current_user
    return @current_user if defined? @current_user
    id = cookies[:user_id]
    @current_user = id && User.find_by(id: id)
  end

  def require_current_user
    unless current_user
      if request.get?
        redirect_to sign_in_path(origin: request.url)
      else
        redirect_to sign_in_path
      end
    end
  end
end
