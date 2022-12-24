class Knight 
  attr_accessor :position :parent

  # [i, j] i = rows, j = columns of board 
  # from the current position, it has 8 possible paths
  # ex: [i + 2, j + 1], [i + 1, j + 2]...[i + 2, j - 1] 
  coordinates = [
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
    
  end

  def knight_moves(start, end)
  end

  def display_path
  end 
  
end 

