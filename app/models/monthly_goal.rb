class MonthlyGoal < Goal

  has_many :sub_goals, class_name: 'Goal', foreign_key: 'goal_id'
  belongs_to :parent_goal, class_name: 'Goal'

  def parents_goals
    @parents_goals ||= YearlyGoal.where(year: year)
  end

end