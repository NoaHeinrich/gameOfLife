require "rspec"
require_relative "../game"

describe Game do
  before(:each) do
    @board = Game.new(3,3)
  end

  describe "#new" do
    it "creates a Game object" do
      expect(@board).to be_a Game
    end

    it "creates a Game with a height" do
      expect(@board.height).to eq 3
    end

    it "creates a Game with a width" do
      expect(@board.width).to eq 3
    end

    it "initializes with a grid of height rows" do
      expect(@board.grid.length).to eq 3
    end

    it "initializes with a grid of width columns" do
      expect(@board.grid[0].length).to eq 3
    end

    it "initializes with a grid of Cell objects" do
      expect(@board.grid[0][0]).to be_a Cell
    end

  end

  describe "#count_neighbors" do
    it "returns the number of living neighbors" do
      #@board.grid[0].map! {|x| x.alive = true }
      #@board.grid[2].map! {|x| x.alive = true }
      #@board.grid[1][0].alive = true
      #@board.grid[1][2].alive = true
      @board.grid = [
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)]
      ]
      expect(@board.count_neighbors(1,1)).to eq 8
    end

    it "returns number of living neighbors if on top-left corner" do
        @board.grid = [
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)]
      ]
        expect(@board.count_neighbors(0,0)).to eq 3
    end

    it "returns the number of living neighbors if on bottom-right corner" do
       @board.grid = [
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)]
      ]
        expect(@board.count_neighbors(2,2)).to eq 3
    end

    it "returns number of living neighbors if on middle top row" do
      @board.grid = [
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)]
      ]
        expect(@board.count_neighbors(0,1)).to eq 5
    end

    it "returns number of living neighbors if on middle bottom row" do
      @board.grid = [
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(true)]
      ]
        expect(@board.count_neighbors(2,1)).to eq 5
    end

  end

  describe "#play_tick" do
    it "replaces the grid with a grid of the same number of columns" do
      @board.play_tick
      expect(@board.grid.length).to eq 3
    end

    it "replaces the grid with a grid of the same number of rows" do
      @board.play_tick
      expect(@board.grid[0].length).to eq 3
    end

    it "kills living cell with no living neighbors" do
      @board.grid = [
        [Cell.new(false),Cell.new(false),Cell.new(false)],
        [Cell.new(false),Cell.new(true),Cell.new(false)],
        [Cell.new(false),Cell.new(false),Cell.new(false)]
      ]
      @board.play_tick
      expect(@board.grid[1][1].alive).to be false
    end

    it "revives a dead cell if it has 3 living neighbors" do
      @board.grid = [
        [Cell.new(false),Cell.new(true),Cell.new(false)],
        [Cell.new(true),Cell.new(true),Cell.new(false)],
        [Cell.new(false),Cell.new(false),Cell.new(false)]
      ]
      @board.play_tick
      expect(@board.grid[0][0].alive).to be true
    end

    it "kills a live cell with 4 living neighbors" do
      @board.grid = [
        [Cell.new(true),Cell.new(true),Cell.new(true)],
        [Cell.new(true),Cell.new(true),Cell.new(false)],
        [Cell.new(false),Cell.new(false),Cell.new(false)]
      ]
      @board.play_tick
      expect(@board.grid[1][1].alive).to be false
    end

    it "leaves a living cell alive if it has 3 living neighbors" do
      @board.grid = [
        [Cell.new(true),Cell.new(true),Cell.new(false)],
        [Cell.new(true),Cell.new(true),Cell.new(false)],
        [Cell.new(false),Cell.new(false),Cell.new(false)]
      ]
      @board.play_tick
      expect(@board.grid[0][0].alive).to be true
    end

    it "leaves a dead cell dead if it has 4 living neighbors" do
      @board.grid = [
        [Cell.new(false),Cell.new(true),Cell.new(false)],
        [Cell.new(true),Cell.new(false),Cell.new(true)],
        [Cell.new(false),Cell.new(true),Cell.new(false)]
      ]
      @board.play_tick
      expect(@board.grid[1][1].alive).to be false
    end

  end

end