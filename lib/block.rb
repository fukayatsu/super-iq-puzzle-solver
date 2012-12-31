BLOCK_DATA = {
  a: [[2, 2, 3], [2, 3, 2], [3, 2, 2]],
  b: [[1, 2, 4], [1, 4, 2], [2, 1, 4], [2, 4, 1], [4, 1, 2], [4, 2, 1]],
  c: [[1, 1, 1]]
}

class Block
  def initialize(type)
    @type = type
    @blocks = BLOCK_DATA[@type]
  end

  def pattern_count
    @blocks.size
  end

  def to_a
    @blocks
  end
end