require_relative "cell"
class Game
  def initialize(height, width)
    @height = height
    @width = width
    @grid = Array.new(height) {Array.new(width) { Cell.new } }
  end

  def count_neighbors
    #sum = 0
    #new_grid = []
    #@grid.each do
    #  row.each do
    #    if not out of bounds, get each neighbor

  end
end