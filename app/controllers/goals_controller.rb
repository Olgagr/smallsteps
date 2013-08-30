class GoalsController < ApplicationController

  def index
    render json: Goal.all
  end

  def year
    yearly_goals = YearlyGoal.where(year: params[:year_number])
    render json: yearly_goals
  end

end


