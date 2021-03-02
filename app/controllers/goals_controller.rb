class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  # create

  def new
    @goal = Goal.new
  end

  def create
    @user = current_user
    @goal = Goal.new(goal_params)
    @goal.user = @user
    if @goal.save
      redirect_to goals_path
    else
      render :new
    end
  end

  # edit

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
  end

  # destroy

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:name, :balance, :completed)
  end
end