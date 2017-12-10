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
    if cell.alive
      if neighbors < 2 || neighbors > 3
        new_cell = Cell.new(false)
      else
        new_cell = Cell.new(true)
      end
    else
      if neighbors == 3
        new_cell = Cell.new(true)
      else
        new_cell = Cell.new(false)
    end
  end

end