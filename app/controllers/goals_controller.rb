class GoalsController < ApplicationController

  def index
    render json: Goal.all
  end

  def year
    yearly_goals = YearlyGoal.where(year: params[:year_number])
    render json: yearly_goals
  end

  def create
    goal = Goal.new(goal_params)
    if goal.save
      render json: goal
    end
  end

  def update
    goal = Goal.find(params[:id])
    if goal.update_attributes(goal_params)
      render json: goal
    end
  end

  def destroy
    Goal.find(params[:id]).destroy
    head :no_content
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :description, :year, :month, :week, :finished, :goal_id)
  end

end


