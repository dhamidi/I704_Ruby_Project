class BinaryTree
  # Takes a 2-dim array as argument and itterates over it one element at a time
  # Creating links between cells along the way
  # Changing Bias of binary tree algorithm into elongated shape is possible
  # Class level method instead of instance method
  def self.binary(grid, elongated = '')
    grid.each_cell do |cell|
      neighbors = []
      neighbors << cell.up if cell.up
      neighbors << cell.right if cell.right

      if elongated == 'VERTICAL'
        neighbors << cell.up if cell.up
      elsif elongated == 'HORIZONTAL'
        neighbors << cell.right if cell.right
      end

      index = rand(neighbors.length)
      neighbor = neighbors[index]
      cell.connect(neighbor) if neighbor
    end
    grid
  end
end
