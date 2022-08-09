# frozen_string_literal: true

require 'pry-byebug'

# builds node objects to populate binary search tree
class Node
  attr_accessor :data, :left_child, :right_child

  include Comparable
  def initialize(data, left_child = nil, right_child = nil)
    @data = data
    @left_child = left_child
    @right_child = right_child
  end
end

# sorts arrays and builds binary search tree with the data
class Tree
  attr_accessor :root

  def initialize(array)
    sort = array.uniq.sort
    p sort
    @root = build_tree(sort)
  end

  def build_tree(array, head = 0, tail = array.length - 1)
    return nil if head > tail

    mid = (head + tail) / 2
    Node.new(array[mid], build_tree(array, head, mid - 1), build_tree(array, mid + 1, tail))
  end

  def insert(value, node = @root)
    if node.nil?
      Node.new(value)
    elsif value < node.data
      node.left_child = insert(value, node.left_child)
      node
    elsif value > node.data
      node.right_child = insert(value, node.right_child)
      node
    end
  end
end

array = [1,7,7,3,11,1,2,3,4,5,6,6,6]
tree = Tree.new(array)
tree.insert(400)
p tree.root.data
