require 'spec_helper'

describe WeeklyGoal do

  describe '#parents_goals' do

    it 'returns all MonthlyGoals from the given month' do
      create(:goal, type: 'MonthlyGoal', month: 2)
      goal_2 = create(:goal, type: 'MonthlyGoal', month: 3)
      goal_3 = create(:goal, type: 'MonthlyGoal', month: 3)

      expect(WeeklyGoal.parents_goals(3).map(&:id)).to include(goal_2.id, goal_3.id)
    end

  end

end