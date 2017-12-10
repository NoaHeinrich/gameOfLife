require "rspec"
require_relative "../game"

describe Game do
  before(:each) do
    @board = Game.new(5,5)
  end

  describe "#new" do
    it "creates a Game object" do
      expect(@board).to be_a Game
    end

    it "creates a Game with a height" do
      expect(@board.height).to eq 5
    end

    it "creates a Game with a width" do
      expect(@board.width).to eq 5
    end

    it "initializes with a grid of height rows" do
      expect(@board.grid.length).to eq 5
    end

    it "initializes with a grid of width columns" do
      expect(@board.grid[0]length).to eq 5
    end

    it "initializes with a grid of Cell objects" do
      expect(@board.grid[0][0]).to be_a Cell
    end

    it "initializes with a grid of Cells that are either alive or dead" do
      expect(@board.grid[0][0].alive).to be true or be false
    end
  end

end