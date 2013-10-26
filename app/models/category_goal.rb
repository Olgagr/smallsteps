class CategoryGoal < ActiveRecord::Base

  belongs_to :category
  belongs_to :goal

end
