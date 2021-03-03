class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :destroy]

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
      redirect_to category_path(@category), notice: 'Expense was successfully created!'
    else
      render :new
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update(expense_params)
    redirect_to category_path(@expense.category), notice: 'Expense was successfully updated!'
  end
  
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to category_path(@expense.category), notice: 'Expense was successfully deleted!'
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:amount, :place, :date)
  end
end
