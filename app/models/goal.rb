class Goal < ActiveRecord::Base

  has_many :category_goals
  has_many :categories, through: :category_goals


  def finished
    read_attribute(:finished) || false
  end

  def as_json(options = {})
    super(methods: [:parents_goals], except: [:created_at, :updated_at])
  end

  def parents_goals
    nil
  end

end
