class Cell
  attr_accessor :alive
  def initialize(status=[true,false].sample)
    @alive = status
  end

end