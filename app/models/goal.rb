class Goal < ActiveRecord::Base

  has_many :sub_goals, class_name: 'Goal', foreign_key: 'goal_id'
  belongs_to :parent_goal, class_name: 'Goal'


  def finished
    read_attribute(:finished) || false
  end

end
