class YearlyGoal < Goal

  has_many :sub_goals, class_name: 'Goal', foreign_key: 'goal_id'

end