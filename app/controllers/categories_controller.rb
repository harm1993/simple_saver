class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @expenses = @category.expenses
  end

  def new
    @category = Category.new
  end

  def create
    @user = current_user
    @category = Category.new(category_params)
    @category.user = @user
    if @category.save
      redirect_to root_path, notice: 'Expense was successfully created!'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to root_path, notice: 'Category was successfully updated!'
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_path, notice: 'Category was successfully deleted!'
  end

  private

  def category_params
    params.require(:category).permit(:name, :goal_per_month)
  end
end
