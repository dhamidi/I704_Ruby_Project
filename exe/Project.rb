#!/usr/bin/env ruby

require 'bundler/setup'
require 'Project'

example = Project::Grid.new(15, 15)

Project::BinaryTree.binary(example)

Project::GamePlay.start(example)
puts example.to_s

# example.[](3,3).connections.each do |con|
#  puts con
# end
