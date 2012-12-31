class Box
  BOX_SIZE = 5

  def initialize(raw_array = nil)
    @raw_array = raw_array || Array.new(125, '-')
  end

  def content
    0
  end

  def size
    BOX_SIZE
  end

  def to_s
    text = ''
    for z in 0...BOX_SIZE
      text += "#{z}\n"
      for y in 0...BOX_SIZE
        for x in 0...BOX_SIZE
          text += "#{@raw_array[Box.raw_index(x, y, z)]}"
          text += " " unless(x == BOX_SIZE - 1)
        end
        text += "\n"
      end
    end
    text
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
    for z in pos[2]...(pos[2] + block[2])
      for y in pos[1]...(pos[1] + block[1])
        for x in pos[0]...(pos[0] + block[0])
          return false if exists_at?(x, y, z)
        end
      end
    end

    true
  end

  def ponts_to_put(block)
    [[1, 1, 1], [2, 1, 1]]
  end

  def put(pos, block, label)
    @raw_array[0] = label
    for z in pos[2]...(pos[2] + block[2])
      for y in pos[1]...(pos[1] + block[1])
        for x in pos[0]...(pos[0] + block[0])
          @raw_array[Box.raw_index(x, y, z)] = label
        end
      end
    end
  end

  def exists_at?(x, y, z)
    @raw_array[Box.raw_index(x, y, z)] != '-'
  end

  def full?
    @raw_array.count('-') == 0
  end

  class << self
    def raw_index(x, y, z)
      x + BOX_SIZE * ( y + BOX_SIZE * z)
    end
  end
end