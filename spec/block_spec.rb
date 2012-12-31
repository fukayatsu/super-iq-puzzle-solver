require 'block'

describe Block do
  context 'new block' do
    describe 'type A' do
      subject { Block.new(:a, 0) }
      its(:volume)        { should == 16 }
      its(:pattern_count) { should == 3 }
    end

    describe 'type B' do
      subject {Block.new(:b, 0)}
      its(:volume)        { should == 8 }
      its(:pattern_count) { should == 6 }
    end

    describe 'type C' do
      subject {Block.new(:c, 0)}
      its(:volume)        { should == 1 }
      its(:pattern_count) { should == 1 }
    end
  end
end