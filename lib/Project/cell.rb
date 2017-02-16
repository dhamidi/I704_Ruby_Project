class Cell
  attr_reader :row, :column
  attr_accessor :up, :down, :left, :right, :player

  #Initializes relevant instance variables; coordinates / connections hash which will be
  #populated by maze creating algorithm + variable to determine if player inhabits this node or not
  
  def initialize(row, column)
    @row, @column = row, column
    @player = false
    @connections = {}
  end

  
  def connect(cell, two_way=true)
    @connections[cell] = true
    cell.connect(self, false) if two_way
    self
  end

  def connected?(cell)
    connection = false
    @connections.each do |link|
      if link == cell
        connection = true
      end
    end
    return connection
  end
  
end
