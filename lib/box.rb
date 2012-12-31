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

class Box
  def size_spec
    [5, 5, 5]
  end

  def content
    0
  end

  def to_s
    NEW_BOX_PRINT
  end

  def raw_array
    Array.new(125, 0)
  end

  def can_put?(pos, block, label = '*')
    true
  end
end