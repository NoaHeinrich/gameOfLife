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

    it "returns true if alive" do
      expect(@live_cell.alive).to be_true
    end

    it "returns false if not alive" do
      expect(@dead_cell).to be_false
    end
  end

  describe "#generate" do
    it "returns a Cell object" do
      new_cell = @live_cell.generate(2)
      expect(new_cell).to be_a Cell
    end

    it "returns a live Cell if living cell has 2 neighbors" do
      new_cell = @live_cell.generate(2)
      expect(new_cell.alive).to be_true
    end

    it "returns a dead Cell if living cell has less than 2 neighbors" do
      new_cell = @live_cell.generate(1)
      expect(new_cell.alive).to be_false
    end

    it "returns a dead Cell if living cell has more than 3 neighbors" do
      new_cell = @live_cell.generate(4)
      expect(new_cell.alive).to be_false
    end
  end
end