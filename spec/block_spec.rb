require 'block'

describe Block do
  context 'new block' do
    describe 'type A' do
      subject { Block.new(:a) }
      its(:pattern_count) { should == 3 }
    end

    describe 'type B' do
      subject { Block.new(:b) }
      its(:pattern_count) { should == 6 }
    end

    describe 'type C' do
      subject { Block.new(:c) }
      its(:pattern_count) { should == 1 }
    end
  end

  describe '#to_a' do
    subject { Block.new(:c).to_a }
    it { should == [[1, 1, 1]] }
  end
end