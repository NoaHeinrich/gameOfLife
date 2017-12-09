class Cell
  attr_accessor :alive
  def initialize(status=[true,false].sample)
    @alive = status
  end

  def generate(neighbors)
    #if cell is alive
    #  if neighbors < 2 OR neighbors > 3
    #    return dead cell
    #  else
    #    return live cell
    #else
    #  if neighbors == 3
    #    return live cell
    #  else
    #    return dead cell
  end

end