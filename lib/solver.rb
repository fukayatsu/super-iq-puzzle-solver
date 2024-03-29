require_relative 'block'
require_relative 'box'

class Solver
  attr_reader :step_count, :box, :box_stock
  def initialize
    @step_count = 0
    @memo = {}
  end

  def step_count
    @step_count
  end

  def solve(box = nil, block_stack = nil)
    if box
      if box.full?
        return box
      elsif block_stack.size == 0
        return nil
      end
    else
      box = Box.new
      block_stack = Array.new(6, :a) + Array.new(6, :b) + Array.new(5, :c)
    end

    # p block_stack.size

    blocks = Block.new(block_stack.shift)
    if block_stack.size == 10
      p Time.now
      p box
    end
    blocks.to_a.each do |block|
      points =  box.points_to_put(block)
      next if points.size == 0
      points.each do |point|
        raw_array = Marshal.load(Marshal.dump(box.raw_array))
        updated_box = Box.new(raw_array)
        updated_box.put(point, block, blocks.type.to_s)

        next if @memo.key? (updated_box.raw_array)
        @memo[updated_box.raw_array] = true

        next_stack = Marshal.load(Marshal.dump(block_stack))
        next_step = solve(updated_box, next_stack)
        return next_step if next_step
      end
    end
    nil
  end
end

if __FILE__ == $PROGRAM_NAME
  solver = Solver.new
  p solver.solve
end