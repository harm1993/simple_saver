class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home intro]
  skip_before_action :authenticate_user!, only: [:intro, :home]

  def home
      @category = Category.new
      @expense = Expense.new
    if user_signed_in?
      @categories = current_user.categories
      @current_goal = current_user.current_goal
    else
      redirect_to introduction_path
    end
  end

  def intro
    render layout: "landing_page"
  end
end
