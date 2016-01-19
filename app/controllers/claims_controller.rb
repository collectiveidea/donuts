class ClaimsController < ApplicationController
  skip_before_action :require_current_user, only: [:new]

  def new
  end

  def create
    current_user.claims.create!(date: Date.current)
    redirect_to root_path
  end
end
