class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home intro]

  def home
    if user_signed_in?
      @categories = current_user.categories
      @goals = current_user.goals
    else
      redirect_to introduction_path
    end
  end

  def intro
    render layout: "landing_page"
  end
end
