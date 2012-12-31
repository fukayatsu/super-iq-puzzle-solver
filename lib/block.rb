BLOCK_DATA = {
  a: [[2, 2, 4], [2, 4, 2], [4, 2, 2]],
  b: [[1, 2, 4], [1, 4, 2], [2, 1, 4], [2, 4, 1], [4, 1, 2], [4, 2, 1]],
  c: [[1, 1, 1]]
}

class Block
  def initialize(type, pattern_number)
    @block_array = BLOCK_DATA[type]
    @pattern_number = pattern_number
  end

  def volume
    @block_array[@pattern_number].inject(1, :*)
  end

  def pattern_count
    @block_array.size
  end
end