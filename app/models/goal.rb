class Goal < ActiveRecord::Base

  def finished
    read_attribute(:finished) || false
  end

end
