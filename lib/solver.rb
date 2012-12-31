require_relative 'block'
require_relative 'box'

class Solver
  attr_reader :step_count, :box, :box_stock
  def initialize(solver = nil)
    if solver
      @step_count = solver.step_count
      @box = solver.box
      @block_stock = solver.block_stock
    else
      @step_count = 0
      @box = Box.new
      @block_stock = Array.new(6, :a) + Array.new(6, :b) + Array.new(5, :c)
    end
  end

  def step_count
    @step_count
  end

  def step(status, pos, block)
    @step_count += 1
  end

  def solved?
    @box.full?
  end
end

if __FILE__ == $PROGRAM_NAME
end