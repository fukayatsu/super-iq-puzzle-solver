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

  def solve(box = nil, block_stack = nil)
    if box
      return box if box.full?
    else
      box = Box.new
      block_stack = Array.new(6, :a) + Array.new(6, :b) + Array.new(5, :c)
    end

    blocks = Block.new(block_stack.shift)
    blocks.to_a.each do |block|
      p box.poins_to_put(block).size
    end

  end
end

if __FILE__ == $PROGRAM_NAME
  solver = Solver.new
  solver.solve
end