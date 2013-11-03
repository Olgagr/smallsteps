class GoalsController < ApplicationController

  before_filter :authenticate_user!

  def index
    get_goals_list
  end

  def create
    goal = params['type'].constantize.new(goal_params)
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
    params.permit(:title, :description, :year, :month, :week, :finished, :goal_id, :category_ids)
  end

  #todo refactor it!
  def get_goals_list
    @goals = ''
    @parents_goals = nil
    if params[:weekNumber]
      @goals = WeeklyGoal.where(year: params[:yearNumber], month: params[:monthNumber], week: params[:weekNumber])
      @parents_goals = WeeklyGoal.parents_goals(params[:monthNumber])
    elsif params[:yearNumber] && params[:monthNumber]
      @goals = MonthlyGoal.where(year: params[:yearNumber], month: params[:monthNumber])
      @parents_goals = MonthlyGoal.parents_goals(params[:yearNumber])
    elsif params[:yearNumber]
      @goals = YearlyGoal.where(year: params[:yearNumber])
    else
      @goals = WeeklyGoal.where(week: Date.today.cweek)
    end
  end

end


