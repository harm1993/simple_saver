class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @user = current_user
    @category = Category.new(category_params)
    @category.user = @user
    if @category.save
      redirect_to home_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :goal_per_month)
  end
end
