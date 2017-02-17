require 'grid'
require 'binary_tree'

example = Grid.new(15,15)

BinaryTree.binary(example)
puts example.to_s

#example.[](3,3).connections.each do |con|
#  puts con
#  puts "now Im here"
#end
