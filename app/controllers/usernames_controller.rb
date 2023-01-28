class UsernamesController < ApplicationController
  before_action :authenticate_user!
  def new
    
  end

  def update
    if username_params[:username].present? && current_user.update(username_params)
      flash[:notice] = "Username Updated!"
      redirect_to dashboard_path
    else
      flash[:alert] = if username_params[:username].blank?
                        "Please Choose a Username"
                      else
                        current_user.errors.full_messages.join(", ")
                      end
      redirect_to new_username_path
    end
  end

  private
  def username_params
    params.require(:user).permit(:username)
  end
end