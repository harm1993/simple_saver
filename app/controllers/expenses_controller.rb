class ExpensesController < ApplicationController
  def index
    category = current_user.categories.find(params[:id])
    @expenses = category.expenses
  end
end
