require 'test_helper.rb'

class CellTest < Minitest::Test
  def test_correct_initialization_of_cell
    test_cell = Cell.new(4,6)
    assert_equal 4, test_cell.row    
  end
end
