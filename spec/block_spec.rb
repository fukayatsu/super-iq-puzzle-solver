require 'block'

describe Block do
  context 'new block' do
    describe 'type A' do
      subject {Block.new(:a, 0)}

      it {volume.should == 16}
      it 'has 3 patterns'
    end

    describe 'type B' do
      subject {Block.new(:b, 0)}

      it 'volume is 8'
      it 'has 6 patterns'
    end

    describe 'type C' do
      subject {Block.new(:c, 0)}

      it 'volume is 1'
      it 'has 1 pattern'
    end
  end
end