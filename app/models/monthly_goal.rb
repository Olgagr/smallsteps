class MonthlyGoal < Goal

  has_many :sub_goals, class_name: 'Goal', foreign_key: 'goal_id'
  belongs_to :parent_goal, class_name: 'Goal'

  default_scope where.not(goal_id: nil).where('week is null')

end