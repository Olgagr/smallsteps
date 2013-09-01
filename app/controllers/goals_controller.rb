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

  private
  def goal_params
    params.require(:goal).permit(:title, :description, :year, :month, :week, :finished, :goal_id)
  end

end


