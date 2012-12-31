require_relative 'block'
require_relative 'box'

class Solver
  attr_reader :step_count, :box, :box_stock
  def initialize
    @step_count = 0
    @block_stock = Array.new(6, :a) + Array.new(6, :b) + Array.new(5, :c)
  end

  def step_count
    @step_count
  end

  def solve(box = nil, blocks = nil)
    if box
      return box if box.full?
    else
      box = Box.new
      blocks = Array.new(6, :a) + Array.new(6, :b) + Array.new(5, :c)
    end

    p blocks.size
    p blocks.shift
    p blocks.size

  end
end

if __FILE__ == $PROGRAM_NAME
  solver = Solver.new
  solver.solve
end