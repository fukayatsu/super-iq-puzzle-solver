require 'solver'

require 'box'
require 'block'

describe Solver do
  context '#new' do
    subject { Solver.new }
    its(:step_count) { should == 0 }
    its(:solved?) { should == false }
  end

  context 'first step' do
    before do
      @solver = Solver.new
      @solver.step(nil, [0, 0, 0], Block.new(:c, 0))
    end
    subject { @solver }
    its(:step_count) { should == 1 }
  end
end