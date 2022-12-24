class Knight 
  attr_accessor :position :parent

  # [i, j] i = rows, j = columns of board 
  # from the current position, it has 8 possible paths
  # ex: [i + 2, j + 1], [i + 1, j + 2]...[i + 2, j - 1] 
  COORDINATES = [
    [2, 1],
    [1, 2],
    [-1, 2],
    [-2, 1],
    [-2, -1], 
    [-1, -2],
    [1, -2],
    [2, -1]
  ];

  def initialize(position, parent)
    @position = position
    @parent = parent
  end

  def children 
    COORDINATES.map { |c| [@position[0] + c[0], @position[1] + c[1]] }
               .keep_if { |c| c[0].between?(0, 7) && c[1].between?(0, 7) }
               .map { |c| Knight.new(c, self) }
  end

  def knight_moves(start_node, end_node)
  end

  
end 

knight = Knight.new([6, 6])
p knight.children

