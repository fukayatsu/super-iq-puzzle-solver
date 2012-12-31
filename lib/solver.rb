class Solver
  def initialize
    @step_count = 0
  end

  def step_count
    @step_count
  end

  def step
    @step_count += 1
  end
end