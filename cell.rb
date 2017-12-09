class Cell
  attr_accessor :alive
  def initialize
    @alive = [true, false].sample
  end

end