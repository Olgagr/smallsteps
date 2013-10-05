class Goal < ActiveRecord::Base

  def finished
    read_attribute(:finished) || false
  end

  def as_json(options={})
    {type: type}.merge super
  end

end
