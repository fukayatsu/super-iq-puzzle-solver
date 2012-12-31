require 'box'


NEW_BOX_PRINT = <<"EOT"
0
- - - - -
- - - - -
- - - - -
- - - - -
- - - - -
1
- - - - -
- - - - -
- - - - -
- - - - -
- - - - -
2
- - - - -
- - - - -
- - - - -
- - - - -
- - - - -
3
- - - - -
- - - - -
- - - - -
- - - - -
- - - - -
4
- - - - -
- - - - -
- - - - -
- - - - -
- - - - -
EOT

describe Box do
  describe 'class method' do
    it { Box.raw_index(0, 0, 0).should == 0 }
    it { Box.raw_index(1, 0, 0).should == 1 }
    it { Box.raw_index(0, 1, 0).should == 5 }
    it { Box.raw_index(1, 1, 2).should == 56 }
  end

  context 'new box' do
    subject { Box.new }
    its(:content) { should == 0 }
    its(:raw_array) { should == Array.new(125, '-') }
    its(:to_s) { should == NEW_BOX_PRINT }
  end

  context 'put block for first step' do
    subject { Box.new }
    context 'can put' do
      it { subject.can_put?([0, 0, 0], [1, 1, 1]).should == true }
      it { subject.can_put?([4, 0, 0], [1, 1, 1]).should == true }
    end
    context 'can not put' do
      it { subject.can_put?([5, 0, 0], [1, 1, 1]).should == false }
      it { subject.can_put?([4, 0, 0], [2, 1, 1]).should == false }
      it { subject.can_put?([0, 0, 0], [6, 1, 1]).should == false }
    end
  end

  context 'put block for 2nd step' do
    subject {
      box = Box.new
      box.put([0, 0, 0], [4, 2, 1], '*')
      box
    }
    context 'can put' do
      it { subject.exists_at?(4, 4, 4).should == false }
      it { subject.can_put?([4, 4, 4], [1, 1, 1]).should == true }
    end
    context 'can not put' do
      it { subject.exists_at?(0, 0, 0).should == true }
      it { subject.can_put?([0, 0, 0], [1, 1, 1]).should == false }
    end
  end

  context "first step" do
    subject { Box.new }
    it {
      subject.put([0,0,0], [1,1,1], '*')
      expected_array = Array.new(125, '-')
      expected_array[0] = '*'
      subject.raw_array.should == expected_array
    }
    it {
      subject.put([0,0,0], [2,1,1], '*')
      expected_array = Array.new(125, '-')
      expected_array[0..1] = ['*', '*']
      subject.raw_array.should == expected_array
    }
  end
end