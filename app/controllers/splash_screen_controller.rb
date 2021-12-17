class SplashScreenController < ApplicationController

  def show;
    redirect_to user_groups_path(current_user) if user_signed_in?
  end
end