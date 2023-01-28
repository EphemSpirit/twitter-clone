class HomeController < ApplicationController
  before_action :redirect_if_current_user

  def index
  end

  private

  def redirect_if_current_user
    redirect_to dashboard_path if current_user
  end
end
