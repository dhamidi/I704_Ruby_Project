require 'cell'

class Grid
  attr_reader :rows, :columns, :grid

  # Sets the dimensions of the grid upon creation of object
  # Creates the 2-dimensional array and configures each cell within with
  # their unique coordinates and possible surrounding neighbors
  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @grid = set_up
    configure_cells
  end

  # Creates the array
  def set_up
    Array.new(rows) do |row|
      Array.new(columns) do |column|
        Cell.new(row, column)
      end
    end
  end

  # assigning coordinates and possible surrounding neighbors coordinates
  def configure_cells
    each_cell do |cell|
      row = cell.row
      col = cell.column
      cell.up    = self[row - 1, col]
      cell.down  = self[row + 1, col]
      cell.left  = self[row, col - 1]
      cell.right = self[row, col + 1]
    end
  end

  # Array accessor used to inhabit the up/down/left/right instance variables of each node/cell
  # && for controlled access to elements in the array; watch out for "off by one error"
  def [](row, column)
    return nil unless row.between?(0, @rows - 1)
    return nil unless column.between?(0, @grid[row].count - 1)
    @grid[row][column]
  end

  # picks a random cell on the grid; rand(value) picks number between 0 and value-1
  def random_cell
    row = rand(@rows)
    column = rand(@grid[row].count)
    puts column
    @grid[row][column]
  end

  # Iterates through each row / through each node
  def each_row
    @grid.each do |row|
      yield row
    end
  end

  def each_cell
    each_row do |row|
      row.each do |cell|
        yield cell if cell
      end
    end
  end

  # overwrites to_s method to show the grid in standard output
  # runs over the array row by row / cell by cell and appends relevant characters
  # since connect method is not called by default on any of the nodes, it will display
  # a  rows X columns sized, fully closed grid
  def to_s
    output = '+' + '---+' * columns + "\n"

    each_row do |row|
      top = '|'
      bottom = '+'
      corner = '+'

      row.each do |cell|
        body = if cell.is_player?
                 ' @ '
               elsif cell.is_target?
                 ' & '
               else
                 '   '
               end

        right_border = (cell.connected?(cell.right) ? ' ' : '|')
        top << body << right_border

        down_border = (cell.connected?(cell.down) ? '   ' : '---')
        bottom << down_border << corner
      end

      output << top << "\n"
      output << bottom << "\n"
    end
    output
  end
end
