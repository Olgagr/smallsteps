class Category < ActiveRecord::Base

  has_many :category_goals
  has_many :goals, through: :category_goals

end
