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

    # 既にブロックが置かれている場所には置けない
    for x in pos[0]...(pos[0] + block[0])
      for y in pos[1]...(pos[1] + block[1])
        for z in pos[2]...(pos[2] + block[2])
          return false if exists_at?(x, y, z)
        end
      end
    end

    true
  end

  def put(pos, block, label)
    @raw_array[0] = label
    for x in pos[0]...(pos[0] + block[0])
      for y in pos[1]...(pos[1] + block[1])
        for z in pos[2]...(pos[2] + block[2])
          @raw_array[Box.raw_index(x, y, z)] = label
        end
      end
    end
  end

  def exists_at?(x, y, z)
    @raw_array[Box.raw_index(x, y, z)] != 0
  end

  class << self
    def raw_index(x, y, z)
      x + BOX_SIZE * ( y + BOX_SIZE * z)
    end
  end
end