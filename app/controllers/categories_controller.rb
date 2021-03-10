class CategoriesController < ApplicationController
  def show
    @category = current_user.categories.find(params[:id])
    @expenses = @category.expenses
  end

  def new
    @category = Category.new
  end

  def create
    @user = current_user
    @category = Category.new(category_params)
    @category.user = @user
    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path, notice: 'Category was successfully created!'}
        format.js { redirect_to root_path, notice: 'Category was successfully created!'}
      else
        format.html { render :new}
        format.js { }
      end
    end
  end

  def edit
    @category = current_user.categories.find(params[:id])
  end

  def update
    @category = current_user.categories.find(params[:id])
    @category.update(category_params)
    redirect_to root_path, notice: 'Category was successfully updated!'
  end

  def destroy
    @category = current_user.categories.find(params[:id])
    @category.destroy
    redirect_to root_path, notice: 'Category was successfully deleted!'
  end

  private

  def category_params
    params.require(:category).permit(:name, :goal_per_month)
  end
end
