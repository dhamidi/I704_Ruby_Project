require 'grid'
require 'binary_tree'
require 'game_logic'

example = Grid.new(15, 15)

BinaryTree.binary(example)

GamePlay.start(example)
puts example.to_s

# example.[](3,3).connections.each do |con|
#  puts con
# end
