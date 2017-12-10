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
    sum = 0
    sum += count_row_above(x,y)
    sum += count_row_below(x,y)
    sum += count_sides(x,y)
    sum

  end

  def play_tick
    #new_grid = []
    #iterate through each row
    #neighbor_num = count_neighbors
    #pass neigbor_num to cell to decide if it lives or dies
    #add living or dead cell to new_grid
    #@grid = new_grid
    new_grid = Array.new(@height) { Array.new(@width) }
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |c, c_index|
        cell = c
        live_neighbors = count_neighbors(c_index, row_index)
        new_cell = cell.generate(live_neighbors)
        new_grid[row_index][c_index] = new_cell
      end
    end

    @grid = new_grid

  end

  def to_s
    string = ""
    @grid.each do |row|
      row.each do |cell|
        if cell.alive
          string += "X"
        else
          string += "O"
        end
      end
      string += "\n"
    end
    string
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

  def count_sides(x,y)
    sum = 0
    if x > 0
      if @grid[y][x-1].alive
        sum += 1
      end
    end
    if x < @width-1
      if @grid[y][x+1].alive
        sum += 1
      end
    end
    sum
  end

end