class MonthlyGoal < Goal

  has_many :sub_goals, class_name: 'Goal', foreign_key: 'goal_id'
  belongs_to :parent_goal, class_name: 'Goal'

  def self.parents_goals(year)
    @parents_goals ||= YearlyGoal.where(year: year)
  end

end