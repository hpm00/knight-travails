class Knight
  attr_accessor :position, :parent

  # [i, j] i = rows, j = columns of board 
  # from the current position, it has 8 possible paths
  # ex: [i + 2, j + 1], [i + 1, j + 2]...[i + 2, j - 1] 
  COORDINATES = [[1, 2], [-2, -1], [-1, 2], [2, -1], [1, -2], [-2, 1], [-1, -2], [2, 1]];

  def initialize(position, parent = nil)
    @position = position
    @parent = parent
  end

  def children
    COORDINATES.map { |c| [@position[0] + c[0], @position[1] + c[1]] }
                   .keep_if { |c| c[0].between?(1, 8) && c[1].between?(1, 8) } # limit it to chessboard coordinate system
                   .map { |c| Knight.new(c, self) } # initialize (record) child's position & its parent
  end

end

# display path by printing position from parent history 
# read explanation below
def path(node)
  path(node.parent) unless node.parent.nil?
  p node.position
end 

def knight_moves(start_node, end_node, queue = [])
  node = Knight.new(start_node) 

  until node.position == end_node
    node.children.each { |child| queue << child}
    node = queue.shift
  end 
  print "Here's your path:\n"
  path(node)
end

# driver script
knight_moves([3,3],[4,3])
'''
Console Display: 

Here is your path:
[3, 3]
[5, 4]
[2, 4]
[4, 3]

Use path() method because dont want to print all children & grandchildren of starting node.
Instead, find ending nodes parent & then its parents parent until back to starting node. 
For example, [4, 3] parent is [2, 4], [2, 4] parent is [4, 5] & so on. 

'''