require 'solver'

require 'box'
require 'block'

describe Solver do
  context '#new' do
    subject { Solver.new }
    its(:step_count) { should == 0 }
  end
end