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
end