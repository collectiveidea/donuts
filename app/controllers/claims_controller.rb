class ClaimsController < ApplicationController
  skip_before_action :require_current_user, only: [:new]

  def new
    @users_claiming_today = User.claiming_today
  end

  def create
    current_user.claims.create!(date: Date.current)
    redirect_to root_path
  end
end
