require 'spec_helper'

describe MonthlyGoal do

  describe '.parents_goals' do

    it 'returns all yearly goals from given year' do
      create(:goal, year: 2012, type: 'YearlyGoal')
      goal_2 = create(:goal, year: 2013, type: 'YearlyGoal')
      goal_3 = create(:goal, year: 2013, type: 'YearlyGoal')

      expect(MonthlyGoal.parents_goals(2013).map(&:id)).to include(goal_2.id, goal_3.id)
    end

  end


end