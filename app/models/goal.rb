class Goal < ActiveRecord::Base

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
