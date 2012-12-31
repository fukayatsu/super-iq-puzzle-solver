require 'solver'

describe Solver do
  context '#new' do
    subject { Solver.new }
    its(:step_count) { should == 0 }
  end

  context 'first step' do
    before do
      @solver = Solver.new
      @solver.step
    end
    subject { @solver }
    its(:step_count) { should == 1 }
  end
end