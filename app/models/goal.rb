class Goal < ActiveRecord::Base

  belongs_to :user
  has_many :category_goals
  has_many :categories, through: :category_goals

  def finished
    read_attribute(:finished) || false
  end

  def as_json(options = {})
    super(except: [:created_at, :updated_at])
  end

  def parents_goals
    nil
  end

end
