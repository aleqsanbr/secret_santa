class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  private

  def authenticate_user!
    redirect_to login_path unless current_user
  end
end
