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
end