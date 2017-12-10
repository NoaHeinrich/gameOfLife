require_relative "cell"
class Game
  attr_reader :height, :width
  attr_accessor :grid
  def initialize(height, width)
    @height = height
    @width = width
    @grid = Array.new(height) {Array.new(width) { Cell.new } }
  end

  def count_neighbors(x, y)
    #sum = 0
    # check all neighbors, look for boundaries
    # if neigbor is alive, sum++
    #return sum


  end

  def play_tick
    #new_grid = []
    #iterate through each row
    #neighbor_num = count_neighbors
    #pass neigbor_num to cell to decide if it lives or dies
    #add living or dead cell to new_grid
    #@grid = new_grid
  end

  private
  def count_row_above(x,y)
    sum = 0
    if x > 0 && y > 0
      if @grid[y-1][x-1].alive
        sum += 1
      end
    end
    if y > 0 && x < @width-1
      if @grid[y-1][x+1].alive
        sum += 1
      end
    end
    if y > 0
      if grid[y-1][x].alive
        sum += 1
      end
    end
    sum
  end

  def count_row_below(x,y)
    sum = 0
    if x > 0 && y < @height-1
      if @grid[y+1][x-1].alive
        sum += 1
      end
    end
    if x < @width-1 && y < @height-1
      if @grid[y+1][x+1].alive
        sum += 1
      end
    end
    if y < @height-1
      if @grid[y+1][x].alive
        sum += 1
      end
    end
    sum
  end

  def count_sides(x)
    sum = 0
  end
end