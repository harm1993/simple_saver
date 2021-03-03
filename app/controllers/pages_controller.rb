class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:intro, :home]

  def home
    if user_signed_in?
      @categories = current_user.categories
      @current_goal = current_user.current_goal
    else
      redirect_to introduction_path
    end
  end

  def intro
  end
end
