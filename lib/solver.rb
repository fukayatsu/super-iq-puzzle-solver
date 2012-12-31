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
      if box.full?
        p box
        exit
      elsif block_stack.size == 0
        return
      end
    else
      box = Box.new
      block_stack = Array.new(6, :a) + Array.new(6, :b) + Array.new(5, :c)
    end

    blocks = Block.new(block_stack.shift)
    has_next = false
    blocks.to_a.each do |block|
      points =  box.points_to_put(block)
      points.each do |point|
        has_next = true
        updated_box = Box.new(box.raw_array)
        updated_box.put(point, block, blocks.type.to_s)
        puts "**************"
        p updated_box

        return solve(updated_box, block_stack)
      end
    end
    return unless has_next
  end
end

if __FILE__ == $PROGRAM_NAME
  solver = Solver.new
  solver.solve
end