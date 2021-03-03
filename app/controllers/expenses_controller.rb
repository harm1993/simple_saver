class ExpensesController < ApplicationController
  def index
    @category = current_user.categories.find(params[:id])
    @expenses = @category.expenses
  end

  def new
    @category = Category.find(params[:category_id])
    @expense = Expense.new
  end

  def create
    @category = Category.find(params[:category_id])
    @expense = Expense.new(expense_params)
    @expense.category = @category
    if @expense.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:amount, :place, :date)
  end
end
