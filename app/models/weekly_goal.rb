class WeeklyGoal < Goal

  has_many :sub_goals, class_name: 'Goal', foreign_key: 'goal_id'
  belongs_to :parent_goal, class_name: 'Goal'

  def self.parents_goals(month)
    MonthlyGoal.where(month: month)
  end

  def self.find_all_from_current_week
    week_number = Date.today.sunday? ? Date.today.cweek+1 : Date.today.cweek
    WeeklyGoal.where(week: week_number)
  end

end