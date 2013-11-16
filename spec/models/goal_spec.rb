require 'spec_helper'

describe Goal do

  describe '#finished' do
    it 'returns false for finished attribute as default' do
      expect(create(:goal).finished).to be_false
    end
  end

  describe '#as_json' do

    it 'returns correctly formated json' do
      parent_goal = stub_model(Goal, id: 1)
      goal = create(:goal, goal_id: parent_goal.id, month: 11, description: 'Lorem ipsum', id: 2, type: 'MonthlyGoal')

      expect(goal.as_json).to eq({"id"=>2, "title"=>"Yearly goal", "description"=>"Lorem ipsum", "year"=>2013, "month"=>11, "week"=>nil, "finished"=>false, "goal_id"=>1})
    end

  end

  describe '.parents_goals' do

    it 'returns nil' do
      goal = stub_model(Goal)
      expect(goal.parents_goals).to be_nil
    end

  end


end
