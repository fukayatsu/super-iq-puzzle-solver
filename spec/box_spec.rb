require 'box'


NEW_BOX_PRINT = <<"EOT"
0
- - - - -
- - - - -
- - - - -
- - - - -
1
- - - - -
- - - - -
- - - - -
- - - - -
2
- - - - -
- - - - -
- - - - -
- - - - -
3
- - - - -
- - - - -
- - - - -
- - - - -
4
- - - - -
- - - - -
- - - - -
- - - - -
EOT

describe Box do
  context 'new box' do
    subject { Box.new }
    its(:size_spec) { should == [5, 5, 5] }
    its(:content) { should == 0 }
    its(:raw_array) { should == Array.new(125, 0) }
    its(:to_s) { should == NEW_BOX_PRINT }
  end

  context 'can put block?' do
    subject { Box.new }
    it { subject.can_put?([0,0,0], [1,1,1]).should == true }
  end
end