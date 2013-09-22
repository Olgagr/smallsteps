class GoalsController < ApplicationController

  before_filter :authenticate_user!

  def index
    render json: get_goals_list
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

  def get_goals_list
    if params[:yearNumber] && params[:monthNumber]
      MonthlyGoal.where(year: params[:yearNumber], month: params[:monthNumber])
    elsif params[:yearNumber]
      YearlyGoal.where(year: params[:yearNumber])
    else
      Goal.all
    end
  end

end


