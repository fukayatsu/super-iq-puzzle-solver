require 'block'

describe Block do
  context 'new block' do
    describe 'type A' do
      subject { Block.new(:a, 0) }
      its(:volume) { should == 16 }
    end

    describe 'type B' do
      subject {Block.new(:b, 0)}
      its(:volume) { should == 8 }
    end

    describe 'type C' do
      subject {Block.new(:c, 0)}
      its(:volume) { should == 1 }
    end
  end
end