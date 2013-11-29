class GoalsController < ApplicationController

  before_filter :authenticate_user!

  def index
    get_goals_list
  end

  def create
    goal = current_user.goals.build(goal_params)
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
    params.require(:goal).permit(:title, :description, :year, :month, :week, :finished, :goal_id, :category_ids, :type)
  end

  #todo refactor it!
  def get_goals_list
    @goals = ''
    @parents_goals = nil
    if params[:weekNumber]
      @goals = current_user.weekly_goals.where(year: params[:yearNumber], month: params[:monthNumber], week: params[:weekNumber])
      @parents_goals = current_user.weekly_goals.parents_goals(params[:monthNumber])
    elsif params[:yearNumber] && params[:monthNumber]
      @goals = current_user.monthly_goals.where(year: params[:yearNumber], month: params[:monthNumber])
      @parents_goals = current_user.monthly_goals.parents_goals(params[:yearNumber])
    elsif params[:yearNumber]
      @goals = current_user.yearly_goals.where(year: params[:yearNumber])
    else
      @goals = current_user.weekly_goals.find_all_from_current_week
    end
  end

end


