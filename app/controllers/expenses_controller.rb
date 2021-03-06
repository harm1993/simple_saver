class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :destroy]

  def index
    @category = current_user.categories.find(params[:id])
    @expenses = @category.expenses
    @expense = Expense.new
  end

  def new
    @category = current_user.categories.find(params[:category_id])
    @expense = Expense.new
  end

  def create
    @category = current_user.categories.find(params[:category_id])
    @expense = Expense.new(expense_params)
    @expense.category = @category
    respond_to do |format|
      if @expense.save
        format.html { redirect_to root_path, notice: 'Expense was successfully created!'}
        format.js { redirect_to root_path, notice: 'Expense was successfully created!'}
      else
        format.html { render :new}
        format.js { }
      end
    end


  end

  def edit
    @expense = Expense.find(params[:id])
  end

  # def update
  #   @expense = Expense.find(params[:id])
  #   @expense.update(expense_params)
  # end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to root_path, notice: 'Expense was successfully deleted!'
  end

  private

  def set_expense
    @expense = Expense.find(params[:id])
  end

  def expense_params
    params.require(:expense).permit(:amount, :place, :date)
  end
end
