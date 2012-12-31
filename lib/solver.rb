require_relative 'block'
require_relative 'box'

class Solver
  def initialize
    @step_count = 0
    @box = Box.new
  end

  def step_count
    @step_count
  end

  def step
    @step_count += 1
  end

  def solved?
    false
  end
end

if __FILE__ == $PROGRAM_NAME
end