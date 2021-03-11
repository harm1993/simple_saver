class GoalsController < ApplicationController
  def index
    @completed_goals = current_user.completed_goals
    @current_goal = current_user.current_goal
  end

  def show
    @goal = Goal.find(params[:id])
  end

  # create

  def new
    @goal = Goal.new
  end

  def create
    @user = current_user
    @goal = Goal.new(goal_params)
    @goal.user = @user
    respond_to do |format|
      if @goal.save
        format.html { redirect_to root_path, notice: 'Goal was successfully created!'}
        format.js { redirect_to root_path, notice: 'Goal was successfully created!'}
      else
        format.html { render :new}
        format.js { }
      end
    end
  end
  # edit

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
    redirect_to root_path, notice: 'Goal was successfully updated!'
  end

  # destroy

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to root_path, notice: 'Goal was successfully deleted!'
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :amount, :completed, :deadline)
  end
end
