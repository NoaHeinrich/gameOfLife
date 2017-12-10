require "rspec"
require_relative "../cell"

describe Cell do
  before(:each) do
    @live_cell = Cell.new(true)
    @dead_cell = Cell.new(false)
  end

  describe "#new" do

    it "is a Cell object" do
      expect(@live_cell).to be_a Cell
    end

    it "creates a living cell" do
      expect(@live_cell.alive).to be true
    end

    it "creates a dead cell" do
      expect(@dead_cell.alive).to be false
    end

  end

  describe "#generate" do
    it "returns a Cell object" do
      new_cell = @live_cell.generate(2)
      expect(new_cell).to be_a Cell
    end

    it "returns a live Cell if living cell has 2 neighbors" do
      new_cell = @live_cell.generate(2)
      expect(new_cell.alive).to be true
    end

    it "returns a dead Cell if living cell has less than 2 neighbors" do
      new_cell = @live_cell.generate(1)
      expect(new_cell.alive).to be false
    end

    it "returns a dead Cell if living cell has more than 3 neighbors" do
      new_cell = @live_cell.generate(4)
      expect(new_cell.alive).to be false
    end

    it "returns a life cell if dead cell has 3 neighbors exactly" do
      new_cell=@dead_cell.generate(3)
      expect(new_cell.alive).to be true
    end

    it "returns a dead cell if dead cell has less than 3 neighbors" do
      new_cell=@dead_cell.generate(2)
      expect(new_cell.alive).to be false
    end
  end
end