BLOCK_DATA = {
  a: { count: 6, data: [[2, 2, 3], [2, 3, 2], [3, 2, 2]] },
  b: { count: 6, data: [[1, 2, 4], [1, 4, 2], [2, 1, 4], [2, 4, 1], [4, 1, 2], [4, 2, 1]] },
  c: { count: 5, data: [[1, 1, 1]] }
}

class Block
  def initialize(type, pattern_number)
    @size_spec = BLOCK_DATA[type][:data][pattern_number]
  end

  def size_spec
    @size_spec
  end

  def volume
    @size_spec.inject(1, :*)
  end
end