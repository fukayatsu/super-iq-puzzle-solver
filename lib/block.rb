BLOCK_DATA = {
  a: [[2, 2, 3], [2, 3, 2], [3, 2, 2]],
  b: [[1, 2, 4], [1, 4, 2], [2, 1, 4], [2, 4, 1], [4, 1, 2], [4, 2, 1]],
  c: [[1, 1, 1]]
}

class Block
  def initialize(type, pattern_number)
    @size_spec = BLOCK_DATA[type][pattern_number]
  end

  def volume
    @size_spec.inject(1, :*)
  end
end