require_relative "cell"
class Game
  def initialize(height, width)
    @height = height
    @width = width
    @grid = Array.new(height) {Array.new(width) { Cell.new([true,false].sample) } }
  end
end