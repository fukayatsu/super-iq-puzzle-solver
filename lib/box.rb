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
  def content
    0
  end

  def to_s
    NEW_BOX_PRINT
  end

  def raw_array
    Array.new(125, 0)
  end

  def can_put?(pos, block)
    return false if pos.any? {|v| v < 0 || v >= BOX_SIZE}
    true
  end
end