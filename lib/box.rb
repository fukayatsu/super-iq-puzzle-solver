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

BOX_SIZE = 5

class Box
  def initialize
    @raw_array = Array.new(125, 0)
  end

  def content
    0
  end

  def to_s
    NEW_BOX_PRINT
  end

  def raw_array
    @raw_array
  end

  def can_put?(pos, block)
    return false unless pos.all? { |v| v >= 0 && v < BOX_SIZE }

    putted_blocks = pos.zip(block)
    return false unless putted_blocks.all? { |v|
      block_end = v[0] + v[1]
      block_end > 0 && block_end <= BOX_SIZE
    }

    true
  end

  def put(pos, block, label)
    @raw_array[0] = label
  end
end